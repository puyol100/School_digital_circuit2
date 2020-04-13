module _register3_r(clk, reset_n, d, q);//register 3
	input clk, reset_n;
	input [2:0] d;//3bits input
	output [2:0] q;//3bits output
	
_dff_r U0_dff_r(.clk(clk),.reset_n(reset_n),.d(d[0]),.q(q[0]));
_dff_r U1_dff_r(.clk(clk),.reset_n(reset_n),.d(d[1]),.q(q[1]));
_dff_r U2_dff_r(.clk(clk),.reset_n(reset_n),.d(d[2]),.q(q[2]));
//instance three _dff_r for 3bits register 
endmodule 