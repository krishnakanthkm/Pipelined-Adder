/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : K-2015.06-SP5-1
// Date      : Sun May 10 01:16:20 2020
/////////////////////////////////////////////////////////////


module ripple_carry_7 ( a, b, cin, rsum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] rsum;
  input cin;
  output cout;
  wire   \intadd_0/CI , \intadd_0/n3 , \intadd_0/n2 , \intadd_0/n1 ;
  tri   \rsum[1] ;
  tri   cout;
  tri   \f1/sum_1 ;
  tri   \intadd_0/SUM[2] ;
  tri   \intadd_0/SUM[1] ;
  assign rsum[0] = \f1/sum_1 ;
  assign rsum[3] = \intadd_0/SUM[2] ;
  assign rsum[2] = \intadd_0/SUM[1] ;

  CFA1X1 \intadd_0/U4  ( .A(b[1]), .B(\intadd_0/CI ), .CI(a[1]), .CO(
        \intadd_0/n3 ), .S(rsum[1]) );
  CFA1X1 \intadd_0/U3  ( .A(b[2]), .B(\intadd_0/n3 ), .CI(a[2]), .CO(
        \intadd_0/n2 ), .S(\intadd_0/SUM[1] ) );
  CFA1X1 \intadd_0/U2  ( .A(b[3]), .B(\intadd_0/n2 ), .CI(a[3]), .CO(
        \intadd_0/n1 ), .S(\intadd_0/SUM[2] ) );
  CAN2XL U1 ( .A(b[0]), .B(a[0]), .Z(\intadd_0/CI ) );
  CNIVX1 U2 ( .A(\intadd_0/n1 ), .Z(cout) );
  CEOX1 U3 ( .A(b[0]), .B(a[0]), .Z(\f1/sum_1 ) );
endmodule


module ripple_carry_6 ( a, b, cin, rsum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] rsum;
  input cin;
  output cout;
  wire   \intadd_1/CI , \intadd_1/n3 , \intadd_1/n2 , \intadd_1/n1 ;
  tri   cout;
  tri   \rsum[0] ;
  tri   \intadd_1/SUM[2] ;
  tri   \intadd_1/SUM[1] ;
  tri   \intadd_1/SUM[0] ;
  assign rsum[3] = \intadd_1/SUM[2] ;
  assign rsum[2] = \intadd_1/SUM[1] ;
  assign rsum[1] = \intadd_1/SUM[0] ;

  CFA1X1 \intadd_1/U4  ( .A(b[1]), .B(\intadd_1/CI ), .CI(a[1]), .CO(
        \intadd_1/n3 ), .S(\intadd_1/SUM[0] ) );
  CFA1X1 \intadd_1/U3  ( .A(b[2]), .B(\intadd_1/n3 ), .CI(a[2]), .CO(
        \intadd_1/n2 ), .S(\intadd_1/SUM[1] ) );
  CFA1X1 \intadd_1/U2  ( .A(b[3]), .B(\intadd_1/n2 ), .CI(a[3]), .CO(
        \intadd_1/n1 ), .S(\intadd_1/SUM[2] ) );
  COR2XL U1 ( .A(a[0]), .B(b[0]), .Z(\intadd_1/CI ) );
  CNIVX1 U2 ( .A(\intadd_1/n1 ), .Z(cout) );
  CENX1 U3 ( .A(a[0]), .B(b[0]), .Z(rsum[0]) );
endmodule


module carry_select_3 ( a, b, cin, csum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] csum;
  input cin;
  output cout;

  tri   cin;
  tri   [3:0] csum;
  tri   cout;
  tri   [3:0] s0;
  tri   c0;
  tri   [3:0] s1;
  tri   c1;

  ripple_carry_7 r1 ( .a(a), .b(b), .cin(1'b0), .rsum(s0), .cout(c0) );
  ripple_carry_6 r2 ( .a(a), .b(b), .cin(1'b1), .rsum(s1), .cout(c1) );
  mux m1 ( .in0(s0), .in1(s1), .sel(cin), .out(csum) );
  mux m2 ( .in0(c0), .in1(c1), .sel(cin), .out(cout) );
endmodule


module ripple_carry_4 ( a, b, cin, rsum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] rsum;
  input cin;
  output cout;
  wire   \intadd_4/CI , \intadd_4/n3 , \intadd_4/n2 , \intadd_4/n1 ;
  tri   cout;
  tri   \intadd_4/SUM[2] ;
  tri   \intadd_4/SUM[1] ;
  tri   \intadd_4/SUM[0] ;
  tri   \rsum[0] ;
  assign rsum[3] = \intadd_4/SUM[2] ;
  assign rsum[2] = \intadd_4/SUM[1] ;
  assign rsum[1] = \intadd_4/SUM[0] ;

  CFA1X1 \intadd_4/U4  ( .A(b[1]), .B(\intadd_4/CI ), .CI(a[1]), .CO(
        \intadd_4/n3 ), .S(\intadd_4/SUM[0] ) );
  CFA1X1 \intadd_4/U3  ( .A(b[2]), .B(\intadd_4/n3 ), .CI(a[2]), .CO(
        \intadd_4/n2 ), .S(\intadd_4/SUM[1] ) );
  CFA1X1 \intadd_4/U2  ( .A(b[3]), .B(\intadd_4/n2 ), .CI(a[3]), .CO(
        \intadd_4/n1 ), .S(\intadd_4/SUM[2] ) );
  COR2XL U1 ( .A(a[0]), .B(b[0]), .Z(\intadd_4/CI ) );
  CNIVX1 U2 ( .A(\intadd_4/n1 ), .Z(cout) );
  CENX1 U3 ( .A(a[0]), .B(b[0]), .Z(rsum[0]) );
endmodule


module ripple_carry_5 ( a, b, cin, rsum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] rsum;
  input cin;
  output cout;
  wire   \intadd_7/CI , \intadd_7/n3 , \intadd_7/n2 , \intadd_7/n1 ;
  tri   \rsum[1] ;
  tri   cout;
  tri   \f1/sum_1 ;
  tri   \intadd_7/SUM[2] ;
  tri   \intadd_7/SUM[1] ;
  assign rsum[0] = \f1/sum_1 ;
  assign rsum[3] = \intadd_7/SUM[2] ;
  assign rsum[2] = \intadd_7/SUM[1] ;

  CFA1X1 \intadd_7/U4  ( .A(b[1]), .B(\intadd_7/CI ), .CI(a[1]), .CO(
        \intadd_7/n3 ), .S(rsum[1]) );
  CFA1X1 \intadd_7/U3  ( .A(b[2]), .B(\intadd_7/n3 ), .CI(a[2]), .CO(
        \intadd_7/n2 ), .S(\intadd_7/SUM[1] ) );
  CFA1X1 \intadd_7/U2  ( .A(b[3]), .B(\intadd_7/n2 ), .CI(a[3]), .CO(
        \intadd_7/n1 ), .S(\intadd_7/SUM[2] ) );
  CAN2XL U1 ( .A(b[0]), .B(a[0]), .Z(\intadd_7/CI ) );
  CNIVX1 U2 ( .A(\intadd_7/n1 ), .Z(cout) );
  CEOX1 U3 ( .A(b[0]), .B(a[0]), .Z(\f1/sum_1 ) );
endmodule


module carry_select_2 ( a, b, cin, csum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] csum;
  input cin;
  output cout;

  tri   cin;
  tri   [3:0] csum;
  tri   cout;
  tri   [3:0] s0;
  tri   c0;
  tri   [3:0] s1;
  tri   c1;

  ripple_carry_5 r1 ( .a(a), .b(b), .cin(1'b0), .rsum(s0), .cout(c0) );
  ripple_carry_4 r2 ( .a(a), .b(b), .cin(1'b1), .rsum(s1), .cout(c1) );
  mux m1 ( .in0(s0), .in1(s1), .sel(cin), .out(csum) );
  mux m2 ( .in0(c0), .in1(c1), .sel(cin), .out(cout) );
endmodule


module ripple_carry_0 ( a, b, cin, rsum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] rsum;
  input cin;
  output cout;
  wire   \intadd_2/CI , \intadd_2/n3 , \intadd_2/n2 , \intadd_2/n1 ;
  tri   cout;
  tri   \intadd_2/SUM[2] ;
  tri   \intadd_2/SUM[1] ;
  tri   \intadd_2/SUM[0] ;
  tri   \rsum[0] ;
  assign rsum[3] = \intadd_2/SUM[2] ;
  assign rsum[2] = \intadd_2/SUM[1] ;
  assign rsum[1] = \intadd_2/SUM[0] ;

  CFA1X1 \intadd_2/U4  ( .A(b[1]), .B(\intadd_2/CI ), .CI(a[1]), .CO(
        \intadd_2/n3 ), .S(\intadd_2/SUM[0] ) );
  CFA1X1 \intadd_2/U3  ( .A(b[2]), .B(\intadd_2/n3 ), .CI(a[2]), .CO(
        \intadd_2/n2 ), .S(\intadd_2/SUM[1] ) );
  CFA1X1 \intadd_2/U2  ( .A(b[3]), .B(\intadd_2/n2 ), .CI(a[3]), .CO(
        \intadd_2/n1 ), .S(\intadd_2/SUM[2] ) );
  COR2XL U1 ( .A(a[0]), .B(b[0]), .Z(\intadd_2/CI ) );
  CNIVX1 U2 ( .A(\intadd_2/n1 ), .Z(cout) );
  CENX1 U3 ( .A(a[0]), .B(b[0]), .Z(rsum[0]) );
endmodule


module ripple_carry_1 ( a, b, cin, rsum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] rsum;
  input cin;
  output cout;
  wire   \intadd_5/CI , \intadd_5/n3 , \intadd_5/n2 , \intadd_5/n1 ;
  tri   \rsum[1] ;
  tri   cout;
  tri   \f1/sum_1 ;
  tri   \intadd_5/SUM[2] ;
  tri   \intadd_5/SUM[1] ;
  assign rsum[0] = \f1/sum_1 ;
  assign rsum[3] = \intadd_5/SUM[2] ;
  assign rsum[2] = \intadd_5/SUM[1] ;

  CFA1X1 \intadd_5/U4  ( .A(b[1]), .B(\intadd_5/CI ), .CI(a[1]), .CO(
        \intadd_5/n3 ), .S(rsum[1]) );
  CFA1X1 \intadd_5/U3  ( .A(b[2]), .B(\intadd_5/n3 ), .CI(a[2]), .CO(
        \intadd_5/n2 ), .S(\intadd_5/SUM[1] ) );
  CFA1X1 \intadd_5/U2  ( .A(b[3]), .B(\intadd_5/n2 ), .CI(a[3]), .CO(
        \intadd_5/n1 ), .S(\intadd_5/SUM[2] ) );
  CAN2XL U1 ( .A(b[0]), .B(a[0]), .Z(\intadd_5/CI ) );
  CNIVX1 U2 ( .A(\intadd_5/n1 ), .Z(cout) );
  CEOX1 U3 ( .A(b[0]), .B(a[0]), .Z(\f1/sum_1 ) );
endmodule


module carry_select_0 ( a, b, cin, csum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] csum;
  input cin;
  output cout;

  tri   cin;
  tri   [3:0] csum;
  tri   cout;
  tri   [3:0] s0;
  tri   c0;
  tri   [3:0] s1;
  tri   c1;

  ripple_carry_1 r1 ( .a(a), .b(b), .cin(1'b0), .rsum(s0), .cout(c0) );
  ripple_carry_0 r2 ( .a(a), .b(b), .cin(1'b1), .rsum(s1), .cout(c1) );
  mux m1 ( .in0(s0), .in1(s1), .sel(cin), .out(csum) );
  mux m2 ( .in0(c0), .in1(c1), .sel(cin), .out(cout) );
endmodule


module ripple_carry_2 ( a, b, cin, rsum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] rsum;
  input cin;
  output cout;
  wire   \intadd_3/CI , \intadd_3/n3 , \intadd_3/n2 , \intadd_3/n1 ;
  tri   cout;
  tri   \intadd_3/SUM[2] ;
  tri   \intadd_3/SUM[1] ;
  tri   \intadd_3/SUM[0] ;
  tri   \rsum[0] ;
  assign rsum[3] = \intadd_3/SUM[2] ;
  assign rsum[2] = \intadd_3/SUM[1] ;
  assign rsum[1] = \intadd_3/SUM[0] ;

  CFA1X1 \intadd_3/U4  ( .A(b[1]), .B(\intadd_3/CI ), .CI(a[1]), .CO(
        \intadd_3/n3 ), .S(\intadd_3/SUM[0] ) );
  CFA1X1 \intadd_3/U3  ( .A(b[2]), .B(\intadd_3/n3 ), .CI(a[2]), .CO(
        \intadd_3/n2 ), .S(\intadd_3/SUM[1] ) );
  CFA1X1 \intadd_3/U2  ( .A(b[3]), .B(\intadd_3/n2 ), .CI(a[3]), .CO(
        \intadd_3/n1 ), .S(\intadd_3/SUM[2] ) );
  COR2XL U1 ( .A(a[0]), .B(b[0]), .Z(\intadd_3/CI ) );
  CNIVX1 U2 ( .A(\intadd_3/n1 ), .Z(cout) );
  CENX1 U3 ( .A(a[0]), .B(b[0]), .Z(rsum[0]) );
endmodule


module ripple_carry_3 ( a, b, cin, rsum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] rsum;
  input cin;
  output cout;
  wire   \intadd_6/CI , \intadd_6/n3 , \intadd_6/n2 , \intadd_6/n1 ;
  tri   \rsum[1] ;
  tri   cout;
  tri   \f1/sum_1 ;
  tri   \intadd_6/SUM[2] ;
  tri   \intadd_6/SUM[1] ;
  assign rsum[0] = \f1/sum_1 ;
  assign rsum[3] = \intadd_6/SUM[2] ;
  assign rsum[2] = \intadd_6/SUM[1] ;

  CFA1X1 \intadd_6/U4  ( .A(b[1]), .B(\intadd_6/CI ), .CI(a[1]), .CO(
        \intadd_6/n3 ), .S(rsum[1]) );
  CFA1X1 \intadd_6/U3  ( .A(b[2]), .B(\intadd_6/n3 ), .CI(a[2]), .CO(
        \intadd_6/n2 ), .S(\intadd_6/SUM[1] ) );
  CFA1X1 \intadd_6/U2  ( .A(b[3]), .B(\intadd_6/n2 ), .CI(a[3]), .CO(
        \intadd_6/n1 ), .S(\intadd_6/SUM[2] ) );
  CAN2XL U1 ( .A(b[0]), .B(a[0]), .Z(\intadd_6/CI ) );
  CNIVX1 U2 ( .A(\intadd_6/n1 ), .Z(cout) );
  CEOX1 U3 ( .A(b[0]), .B(a[0]), .Z(\f1/sum_1 ) );
endmodule


module carry_select_1 ( a, b, cin, csum, cout );
  input [3:0] a;
  input [3:0] b;
  output [3:0] csum;
  input cin;
  output cout;

  tri   cin;
  tri   [3:0] csum;
  tri   cout;
  tri   [3:0] s0;
  tri   c0;
  tri   [3:0] s1;
  tri   c1;

  ripple_carry_3 r1 ( .a(a), .b(b), .cin(1'b0), .rsum(s0), .cout(c0) );
  ripple_carry_2 r2 ( .a(a), .b(b), .cin(1'b1), .rsum(s1), .cout(c1) );
  mux m1 ( .in0(s0), .in1(s1), .sel(cin), .out(csum) );
  mux m2 ( .in0(c0), .in1(c1), .sel(cin), .out(cout) );
endmodule


module pipeline ( clk, rst, a, b, cin, psum, cout );
  input [15:0] a;
  input [15:0] b;
  output [15:0] psum;
  input clk, rst, cin;
  output cout;
  wire   n1, n33, n34, n35;
  wire   [3:0] ai;
  wire   [3:0] bi;
  wire   [3:0] a1;
  wire   [3:0] b1;
  wire   [3:0] a21;
  wire   [3:0] b21;
  wire   [3:0] a32;
  wire   [3:0] b32;
  wire   [3:0] s01_d;
  wire   [3:0] s02_d;
  wire   [3:0] a1_d;
  wire   [3:0] b1_d;
  wire   [3:0] a2_d;
  wire   [3:0] b2_d;
  wire   [3:0] a21_d;
  wire   [3:0] b21_d;
  wire   [3:0] s11_d;
  wire   [3:0] a3_d;
  wire   [3:0] b3_d;
  wire   [3:0] a31_d;
  wire   [3:0] b31_d;
  wire   [3:0] a32_d;
  wire   [3:0] b32_d;
  tri   cout;
  tri   ci;
  tri   [3:0] s0_d;
  tri   co0_d;
  tri   co0;
  tri   [3:0] s1_d;
  tri   co1_d;
  tri   co1;
  tri   [3:0] s2_d;
  tri   co2_d;
  tri   co2;

  carry_select_3 cs0 ( .a(ai), .b(bi), .cin(ci), .csum(s0_d), .cout(co0_d) );
  carry_select_2 cs1 ( .a(a1), .b(b1), .cin(co0), .csum(s1_d), .cout(co1_d) );
  carry_select_1 cs2 ( .a(a21), .b(b21), .cin(co1), .csum(s2_d), .cout(co2_d)
         );
  carry_select_0 cs3 ( .a(a32), .b(b32), .cin(co2), .csum(psum[15:12]), .cout(
        cout) );
  CFD2QXL \s0_reg[0]  ( .D(s0_d[0]), .CP(clk), .CD(n35), .Q(s01_d[0]) );
  CFD2QXL \s0_reg[1]  ( .D(s0_d[1]), .CP(clk), .CD(n1), .Q(s01_d[1]) );
  CFD2QXL \s0_reg[2]  ( .D(s0_d[2]), .CP(clk), .CD(n35), .Q(s01_d[2]) );
  CFD2QXL \s0_reg[3]  ( .D(s0_d[3]), .CP(clk), .CD(n1), .Q(s01_d[3]) );
  CFD2QXL \s1_reg[0]  ( .D(s1_d[0]), .CP(clk), .CD(n33), .Q(s11_d[0]) );
  CFD2QXL \s1_reg[1]  ( .D(s1_d[1]), .CP(clk), .CD(n34), .Q(s11_d[1]) );
  CFD2QXL \s1_reg[2]  ( .D(s1_d[2]), .CP(clk), .CD(n35), .Q(s11_d[2]) );
  CFD2QXL \s1_reg[3]  ( .D(s1_d[3]), .CP(clk), .CD(n33), .Q(s11_d[3]) );
  CFD2QXL \s2_reg[0]  ( .D(s2_d[0]), .CP(clk), .CD(n1), .Q(psum[8]) );
  CFD2QXL \s2_reg[1]  ( .D(s2_d[1]), .CP(clk), .CD(n34), .Q(psum[9]) );
  CFD2QXL \s2_reg[2]  ( .D(s2_d[2]), .CP(clk), .CD(n1), .Q(psum[10]) );
  CFD2QXL \s2_reg[3]  ( .D(s2_d[3]), .CP(clk), .CD(n35), .Q(psum[11]) );
  CFD2QXL co0_reg ( .D(co0_d), .CP(clk), .CD(n34), .Q(co0) );
  CFD2QXL co1_reg ( .D(co1_d), .CP(clk), .CD(n1), .Q(co1) );
  CFD2QXL co2_reg ( .D(co2_d), .CP(clk), .CD(n33), .Q(co2) );
  CFD2QXL \s11_reg[3]  ( .D(s11_d[3]), .CP(clk), .CD(n35), .Q(psum[7]) );
  CFD2QXL \s11_reg[2]  ( .D(s11_d[2]), .CP(clk), .CD(n1), .Q(psum[6]) );
  CFD2QXL \s11_reg[1]  ( .D(s11_d[1]), .CP(clk), .CD(n33), .Q(psum[5]) );
  CFD2QXL \s11_reg[0]  ( .D(s11_d[0]), .CP(clk), .CD(n35), .Q(psum[4]) );
  CFD2QXL \s02_reg[3]  ( .D(s02_d[3]), .CP(clk), .CD(n35), .Q(psum[3]) );
  CFD2QXL \s02_reg[2]  ( .D(s02_d[2]), .CP(clk), .CD(n1), .Q(psum[2]) );
  CFD2QXL \s02_reg[1]  ( .D(s02_d[1]), .CP(clk), .CD(n35), .Q(psum[1]) );
  CFD2QXL \s02_reg[0]  ( .D(s02_d[0]), .CP(clk), .CD(n1), .Q(psum[0]) );
  CFD2QXL \s01_reg[3]  ( .D(s01_d[3]), .CP(clk), .CD(n1), .Q(s02_d[3]) );
  CFD2QXL \s01_reg[2]  ( .D(s01_d[2]), .CP(clk), .CD(n33), .Q(s02_d[2]) );
  CFD2QXL \s01_reg[1]  ( .D(s01_d[1]), .CP(clk), .CD(n1), .Q(s02_d[1]) );
  CFD2QXL \s01_reg[0]  ( .D(s01_d[0]), .CP(clk), .CD(n1), .Q(s02_d[0]) );
  CFD2QXL \b32_reg[3]  ( .D(b32_d[3]), .CP(clk), .CD(n33), .Q(b32[3]) );
  CFD2QXL \b32_reg[2]  ( .D(b32_d[2]), .CP(clk), .CD(n34), .Q(b32[2]) );
  CFD2QXL \b32_reg[1]  ( .D(b32_d[1]), .CP(clk), .CD(n35), .Q(b32[1]) );
  CFD2QXL \b32_reg[0]  ( .D(b32_d[0]), .CP(clk), .CD(n34), .Q(b32[0]) );
  CFD2QXL \b31_reg[3]  ( .D(b31_d[3]), .CP(clk), .CD(n33), .Q(b32_d[3]) );
  CFD2QXL \b31_reg[2]  ( .D(b31_d[2]), .CP(clk), .CD(n34), .Q(b32_d[2]) );
  CFD2QXL \b31_reg[1]  ( .D(b31_d[1]), .CP(clk), .CD(n35), .Q(b32_d[1]) );
  CFD2QXL \b31_reg[0]  ( .D(b31_d[0]), .CP(clk), .CD(n33), .Q(b32_d[0]) );
  CFD2QXL \b21_reg[3]  ( .D(b21_d[3]), .CP(clk), .CD(n34), .Q(b21[3]) );
  CFD2QXL \b21_reg[2]  ( .D(b21_d[2]), .CP(clk), .CD(n35), .Q(b21[2]) );
  CFD2QXL \b21_reg[1]  ( .D(b21_d[1]), .CP(clk), .CD(n35), .Q(b21[1]) );
  CFD2QXL \b21_reg[0]  ( .D(b21_d[0]), .CP(clk), .CD(n1), .Q(b21[0]) );
  CFD2QXL \b3_reg[3]  ( .D(b3_d[3]), .CP(clk), .CD(n33), .Q(b31_d[3]) );
  CFD2QXL \b3_reg[2]  ( .D(b3_d[2]), .CP(clk), .CD(n1), .Q(b31_d[2]) );
  CFD2QXL \b3_reg[1]  ( .D(b3_d[1]), .CP(clk), .CD(n33), .Q(b31_d[1]) );
  CFD2QXL \b3_reg[0]  ( .D(b3_d[0]), .CP(clk), .CD(n34), .Q(b31_d[0]) );
  CFD2QXL \b2_reg[3]  ( .D(b2_d[3]), .CP(clk), .CD(n35), .Q(b21_d[3]) );
  CFD2QXL \b2_reg[2]  ( .D(b2_d[2]), .CP(clk), .CD(n33), .Q(b21_d[2]) );
  CFD2QXL \b2_reg[1]  ( .D(b2_d[1]), .CP(clk), .CD(n1), .Q(b21_d[1]) );
  CFD2QXL \b2_reg[0]  ( .D(b2_d[0]), .CP(clk), .CD(n33), .Q(b21_d[0]) );
  CFD2QXL \b1_reg[3]  ( .D(b1_d[3]), .CP(clk), .CD(n34), .Q(b1[3]) );
  CFD2QXL \b1_reg[2]  ( .D(b1_d[2]), .CP(clk), .CD(n35), .Q(b1[2]) );
  CFD2QXL \b1_reg[1]  ( .D(b1_d[1]), .CP(clk), .CD(n33), .Q(b1[1]) );
  CFD2QXL \b1_reg[0]  ( .D(b1_d[0]), .CP(clk), .CD(n35), .Q(b1[0]) );
  CFD2QXL \a32_reg[3]  ( .D(a32_d[3]), .CP(clk), .CD(n34), .Q(a32[3]) );
  CFD2QXL \a32_reg[2]  ( .D(a32_d[2]), .CP(clk), .CD(n34), .Q(a32[2]) );
  CFD2QXL \a32_reg[1]  ( .D(a32_d[1]), .CP(clk), .CD(n35), .Q(a32[1]) );
  CFD2QXL \a32_reg[0]  ( .D(a32_d[0]), .CP(clk), .CD(n1), .Q(a32[0]) );
  CFD2QXL \a31_reg[3]  ( .D(a31_d[3]), .CP(clk), .CD(n33), .Q(a32_d[3]) );
  CFD2QXL \a31_reg[2]  ( .D(a31_d[2]), .CP(clk), .CD(n34), .Q(a32_d[2]) );
  CFD2QXL \a31_reg[1]  ( .D(a31_d[1]), .CP(clk), .CD(n35), .Q(a32_d[1]) );
  CFD2QXL \a31_reg[0]  ( .D(a31_d[0]), .CP(clk), .CD(n1), .Q(a32_d[0]) );
  CFD2QXL \a21_reg[3]  ( .D(a21_d[3]), .CP(clk), .CD(n1), .Q(a21[3]) );
  CFD2QXL \a21_reg[2]  ( .D(a21_d[2]), .CP(clk), .CD(n1), .Q(a21[2]) );
  CFD2QXL \a21_reg[1]  ( .D(a21_d[1]), .CP(clk), .CD(n33), .Q(a21[1]) );
  CFD2QXL \a21_reg[0]  ( .D(a21_d[0]), .CP(clk), .CD(n34), .Q(a21[0]) );
  CFD2QXL \a3_reg[3]  ( .D(a3_d[3]), .CP(clk), .CD(n1), .Q(a31_d[3]) );
  CFD2QXL \a3_reg[2]  ( .D(a3_d[2]), .CP(clk), .CD(n34), .Q(a31_d[2]) );
  CFD2QXL \a3_reg[1]  ( .D(a3_d[1]), .CP(clk), .CD(n34), .Q(a31_d[1]) );
  CFD2QXL \a3_reg[0]  ( .D(a3_d[0]), .CP(clk), .CD(n35), .Q(a31_d[0]) );
  CFD2QXL \a2_reg[3]  ( .D(a2_d[3]), .CP(clk), .CD(n34), .Q(a21_d[3]) );
  CFD2QXL \a2_reg[2]  ( .D(a2_d[2]), .CP(clk), .CD(n1), .Q(a21_d[2]) );
  CFD2QXL \a2_reg[1]  ( .D(a2_d[1]), .CP(clk), .CD(n33), .Q(a21_d[1]) );
  CFD2QXL \a2_reg[0]  ( .D(a2_d[0]), .CP(clk), .CD(n34), .Q(a21_d[0]) );
  CFD2QXL \a1_reg[3]  ( .D(a1_d[3]), .CP(clk), .CD(n35), .Q(a1[3]) );
  CFD2QXL \a1_reg[2]  ( .D(a1_d[2]), .CP(clk), .CD(n35), .Q(a1[2]) );
  CFD2QXL \a1_reg[1]  ( .D(a1_d[1]), .CP(clk), .CD(n35), .Q(a1[1]) );
  CFD2QXL \a1_reg[0]  ( .D(a1_d[0]), .CP(clk), .CD(n35), .Q(a1[0]) );
  CFD2QXL ci_reg ( .D(cin), .CP(clk), .CD(n34), .Q(ci) );
  CFD2QXL \bl_reg[3]  ( .D(b[15]), .CP(clk), .CD(n1), .Q(b3_d[3]) );
  CFD2QXL \bl_reg[2]  ( .D(b[14]), .CP(clk), .CD(n33), .Q(b3_d[2]) );
  CFD2QXL \bl_reg[1]  ( .D(b[13]), .CP(clk), .CD(n34), .Q(b3_d[1]) );
  CFD2QXL \bl_reg[0]  ( .D(b[12]), .CP(clk), .CD(n33), .Q(b3_d[0]) );
  CFD2QXL \bk_reg[3]  ( .D(b[11]), .CP(clk), .CD(n33), .Q(b2_d[3]) );
  CFD2QXL \bk_reg[2]  ( .D(b[10]), .CP(clk), .CD(n35), .Q(b2_d[2]) );
  CFD2QXL \bk_reg[1]  ( .D(b[9]), .CP(clk), .CD(n33), .Q(b2_d[1]) );
  CFD2QXL \bk_reg[0]  ( .D(b[8]), .CP(clk), .CD(n1), .Q(b2_d[0]) );
  CFD2QXL \bj_reg[3]  ( .D(b[7]), .CP(clk), .CD(n33), .Q(b1_d[3]) );
  CFD2QXL \bj_reg[2]  ( .D(b[6]), .CP(clk), .CD(n34), .Q(b1_d[2]) );
  CFD2QXL \bj_reg[1]  ( .D(b[5]), .CP(clk), .CD(n35), .Q(b1_d[1]) );
  CFD2QXL \bj_reg[0]  ( .D(b[4]), .CP(clk), .CD(n34), .Q(b1_d[0]) );
  CFD2QXL \bi_reg[3]  ( .D(b[3]), .CP(clk), .CD(n34), .Q(bi[3]) );
  CFD2QXL \bi_reg[2]  ( .D(b[2]), .CP(clk), .CD(n34), .Q(bi[2]) );
  CFD2QXL \bi_reg[1]  ( .D(b[1]), .CP(clk), .CD(n35), .Q(bi[1]) );
  CFD2QXL \bi_reg[0]  ( .D(b[0]), .CP(clk), .CD(n1), .Q(bi[0]) );
  CFD2QXL \al_reg[3]  ( .D(a[15]), .CP(clk), .CD(n34), .Q(a3_d[3]) );
  CFD2QXL \al_reg[2]  ( .D(a[14]), .CP(clk), .CD(n1), .Q(a3_d[2]) );
  CFD2QXL \al_reg[1]  ( .D(a[13]), .CP(clk), .CD(n1), .Q(a3_d[1]) );
  CFD2QXL \al_reg[0]  ( .D(a[12]), .CP(clk), .CD(n33), .Q(a3_d[0]) );
  CFD2QXL \ak_reg[3]  ( .D(a[11]), .CP(clk), .CD(n1), .Q(a2_d[3]) );
  CFD2QXL \ak_reg[2]  ( .D(a[10]), .CP(clk), .CD(n1), .Q(a2_d[2]) );
  CFD2QXL \ak_reg[1]  ( .D(a[9]), .CP(clk), .CD(n33), .Q(a2_d[1]) );
  CFD2QXL \ak_reg[0]  ( .D(a[8]), .CP(clk), .CD(n34), .Q(a2_d[0]) );
  CFD2QXL \aj_reg[3]  ( .D(a[7]), .CP(clk), .CD(n35), .Q(a1_d[3]) );
  CFD2QXL \aj_reg[2]  ( .D(a[6]), .CP(clk), .CD(n34), .Q(a1_d[2]) );
  CFD2QXL \aj_reg[1]  ( .D(a[5]), .CP(clk), .CD(n33), .Q(a1_d[1]) );
  CFD2QXL \aj_reg[0]  ( .D(a[4]), .CP(clk), .CD(n33), .Q(a1_d[0]) );
  CFD2QXL \ai_reg[3]  ( .D(a[3]), .CP(clk), .CD(n34), .Q(ai[3]) );
  CFD2QXL \ai_reg[2]  ( .D(a[2]), .CP(clk), .CD(n35), .Q(ai[2]) );
  CFD2QXL \ai_reg[1]  ( .D(a[1]), .CP(clk), .CD(n33), .Q(ai[1]) );
  CFD2QXL \ai_reg[0]  ( .D(a[0]), .CP(clk), .CD(n33), .Q(ai[0]) );
  CIVX2 U107 ( .A(rst), .Z(n35) );
  CIVX2 U108 ( .A(rst), .Z(n1) );
  CIVX2 U109 ( .A(rst), .Z(n33) );
  CIVX2 U110 ( .A(rst), .Z(n34) );
endmodule

