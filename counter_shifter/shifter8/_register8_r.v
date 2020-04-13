module _register8_r(clk, reset_n, d, q);//module for resettable register 8
	input clk, reset_n;
	input 	[7:0] d;
	output 	[7:0] q;
//module _dff_r(clk, reset_n, d, q)
_dff_r A0_dff_r(.clk(clk),.reset_n(reset_n),.d(d[0]),.q(q[0]));
_dff_r A1_dff_r(.clk(clk),.reset_n(reset_n),.d(d[1]),.q(q[1]));
_dff_r A2_dff_r(.clk(clk),.reset_n(reset_n),.d(d[2]),.q(q[2]));
_dff_r A3_dff_r(.clk(clk),.reset_n(reset_n),.d(d[3]),.q(q[3]));
_dff_r A4_dff_r(.clk(clk),.reset_n(reset_n),.d(d[4]),.q(q[4]));
_dff_r A5_dff_r(.clk(clk),.reset_n(reset_n),.d(d[5]),.q(q[5]));
_dff_r A6_dff_r(.clk(clk),.reset_n(reset_n),.d(d[6]),.q(q[6]));
_dff_r A7_dff_r(.clk(clk),.reset_n(reset_n),.d(d[7]),.q(q[7]));
//instance 8 dff_r for 8 register
endmodule 