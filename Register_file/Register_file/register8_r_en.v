module register8_r_en(clk,reset_n,d_in,d_out,en);//register 8
	input clk, reset_n, en;
	input [7:0]d_in;
	output [7:0]d_out;
 //_dff_r_en(clk,reset_n,en,d,q);
_dff_r_en A0(.clk(clk),.reset_n(reset_n),.en(en),.d(d_in[0]),.q(d_out[0]));
_dff_r_en A1(.clk(clk),.reset_n(reset_n),.en(en),.d(d_in[1]),.q(d_out[1]));
_dff_r_en A2(.clk(clk),.reset_n(reset_n),.en(en),.d(d_in[2]),.q(d_out[2]));
_dff_r_en A3(.clk(clk),.reset_n(reset_n),.en(en),.d(d_in[3]),.q(d_out[3]));
_dff_r_en A4(.clk(clk),.reset_n(reset_n),.en(en),.d(d_in[4]),.q(d_out[4]));
_dff_r_en A5(.clk(clk),.reset_n(reset_n),.en(en),.d(d_in[5]),.q(d_out[5]));
_dff_r_en A6(.clk(clk),.reset_n(reset_n),.en(en),.d(d_in[6]),.q(d_out[6]));
_dff_r_en A7(.clk(clk),.reset_n(reset_n),.en(en),.d(d_in[7]),.q(d_out[7]));
//instances for 8bits register 	
endmodule 