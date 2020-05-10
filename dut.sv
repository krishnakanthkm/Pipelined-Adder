module pipeline (input clk, rst, input [15:0] a, b, input cin, output [15:0] psum, output cout);


reg [3:0] ai, ai_d, bi, bi_d, aj, aj_d, bj, bj_d, ak, ak_d, bk, bk_d, al, al_d, 
    bl, bl_d, a2, a2_d, b2, b2_d, a21, a21_d, b21, b21_d, a3, a3_d, a31, 
    a31_d, b31, b31_d, a1, a1_d, b1, b1_d, b3, b3_d, a32, a32_d, b32, b32_d;
reg [3:0] s0, s0_d, s1, s1_d, s01, s01_d, s2, s2_d, s02, s02_d, s11, s11_d;
reg co0, co0_d, co1, co1_d, co2, co2_d, ci, ci_d;


carry_select cs0 (.a(ai), .b(bi), .cin(ci), .csum(s0_d), .cout(co0_d));
carry_select cs1 (.a(a1), .b(b1), .cin(co0), .csum(s1_d), .cout(co1_d));
carry_select cs2 (.a(a21), .b(b21), .cin(co1), .csum(s2_d), .cout(co2_d));
carry_select cs3 (.a(a32), .b(b32), .cin(co2), .csum(psum[15:12]), .cout(cout));

assign psum[11:8] = s2;
assign psum[7:4] = s11;
assign psum[3:0] = s02;

always @(*) begin

    ai_d = a[3:0]; bi_d = b[3:0]; aj_d = a[7:4]; bj_d = b[7:4]; ak_d = a[11:8]; bk_d = b[11:8]; al_d = a[15:12]; bl_d = b[15:12];
    ci_d = cin;

    s01_d =   s0; s02_d =   s01;
    
    a1_d =  aj; b1_d =  bj;
    
    a2_d =  ak; b2_d =  bk; a21_d =  a2; b21_d =  b2;
    
    s11_d =  s1;
    
    a3_d =  al; b3_d =  bl; a31_d =  a3; b31_d =  b3; a32_d =  a31; b32_d =  b31;
end

always @(posedge(clk) or posedge(rst)) begin
    if(rst) begin
        s0  <=      0;
        co0 <=      0;
        s01 <=      0;
        s02 <=      0;
        a1  <=      0;
        b1  <=      0;
        s1  <=      0;
        co1 <=      0;
        s11 <=      0;
        a2  <=      0;
        b2  <=      0;
        a21 <=      0;
        b21 <=      0;
        s2  <=      0;
        co2 <=      0;
        a3  <=      0;
        b3  <=      0;
        a31 <=      0;
        b31 <=      0;
        a32 <=      0;
        b32 <=      0;
        ai  <=      0;
        bi  <=      0;
        aj  <=      0;
        bj  <=      0;
        ak  <=      0;
        bk  <=      0;
        al  <=      0;
        bl  <=      0;
        ci  <=      0;
    end
    else begin
        s0      <= #1 s0_d;
        co0     <= #1 co0_d;
        s01     <= #1 s01_d;
        s02     <= #1 s02_d;
        a1      <= #1 a1_d;
        b1      <= #1 b1_d;
        s1      <= #1 s1_d;
        co1     <= #1 co1_d;
        s11     <= #1 s11_d;
        a2      <= #1 a2_d;
        b2      <= #1 b2_d;
        a21     <= #1 a21_d;
        b21     <= #1 b21_d;
        s2      <= #1 s2_d;
        co2     <= #1 co2_d;
        a3      <= #1 a3_d;
        b3      <= #1 b3_d;
        a31     <= #1 a31_d;
        b31     <= #1 b31_d;
        a32     <= #1 a32_d;
        b32     <= #1 b32_d;
        ai      <= #1 ai_d;
        bi      <= #1 bi_d;
        aj      <= #1 aj_d;
        bj      <= #1 bj_d;
        ak      <= #1 ak_d;
        bk      <= #1 bk_d;
        al      <= #1 al_d;
        bl      <= #1 bl_d;
        ci      <= #1 ci_d;
    end
end

endmodule : pipeline

module carry_select (input [3:0] a, b, input cin, output [3:0] csum, output cout);
    
    wire [3:0] s0, s1;
    wire c0, c1;
    
    ripple_carry r1 (.a(a), .b(b), .cin(1'b0), .rsum(s0), .cout(c0));
    ripple_carry r2 (.a(a), .b(b), .cin(1'b1), .rsum(s1), .cout(c1));
    
    mux #(4) m1 (.in0(s0), .in1(s1), .sel(cin), .out(csum));
    mux #(1) m2 (.in0(c0), .in1(c1), .sel(cin), .out(cout));
    
endmodule : carry_select

module mux(in0, in1, sel, out);
    parameter width = 16;
    input [width-1:0] in0, in1;
    input sel;
    output [width-1:0] out;
    assign out = (sel)?in1:in0;
endmodule : mux

module ripple_carry (input [3:0] a, b, input cin, output [3:0] rsum, output cout);
    wire c1, c2, c3;
    full_adder f1(.a(a[0]), .b(b[0]), .cin(cin), .fsum(rsum[0]), .cout(c1));
    full_adder f2(.a(a[1]), .b(b[1]), .cin(c1), .fsum(rsum[1]), .cout(c2));
    full_adder f3(.a(a[2]), .b(b[2]), .cin(c2), .fsum(rsum[2]), .cout(c3));
    full_adder f4(.a(a[3]), .b(b[3]), .cin(c3), .fsum(rsum[3]), .cout(cout));
endmodule : ripple_carry

module full_adder(input a, b, cin, output fsum, cout);
    wire sum_1;
    wire cout_1,cout_2;
    half_adder ha1 (.a(a), .b(b), .hsum(sum_1), .cout(cout_1));
    half_adder ha2 (.a(cin), .b(sum_1), .hsum(fsum), .cout(cout_2));
    or o (cout, cout_1, cout_2);
endmodule : full_adder

module half_adder(input a, b, output hsum, cout);
    xor px (hsum,a,b);
    and pa (cout,a,b);
endmodule : half_adder
