// Code your testbench here
// or browse Examples
`timescale 1ns/10ps
`include "dut.sv"

module test;

reg clk;
reg reset;
reg [15:0] a, b;
reg cin;
reg [15:0] sum;
reg cout;

pipeline p(clk,reset,a,b,cin,sum,cout);

initial begin
 reset = 1;
 #10; reset = 0;
end

initial begin
 clk=1;
 repeat(1000) begin
    #5 clk = 0;
    #5 clk = 1;
 end
 $finish;
end

initial begin
    a = 0; b = 0; cin = 0;
    repeat (50) begin
        #100;
      a = $urandom();
      b = $urandom();
        cin = $urandom();
    end

end

  initial begin
    $monitor(" time = %t,  a = %d, b= %d, cin = %d, cout = %d, sum = %d", $time, a,b,cin,cout,sum);
  end
  
initial begin
 $dumpfile("krishna.vcd");
 $dumpvars(0);
end

endmodule;
