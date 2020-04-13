module register32_8(clk,reset_n,en,d_in,d_out0,d_out1,d_out2,d_out3,d_out4,d_out5,d_out6,d_out7);
	input clk, reset_n;
	input [7:0]en;
	input [31:0]d_in;
	output [31:0]d_out0,d_out1,d_out2,d_out3,d_out4,d_out5,d_out6,d_out7;
	
//module register32_r_en(clk,reset_n,d_in,d_out,en);
register32_r_en C0(.clk(clk),.reset_n(reset_n),.d_in(d_in),.d_out(d_out0),.en(en[0]));
register32_r_en C1(.clk(clk),.reset_n(reset_n),.d_in(d_in),.d_out(d_out1),.en(en[1]));
register32_r_en C2(.clk(clk),.reset_n(reset_n),.d_in(d_in),.d_out(d_out2),.en(en[2]));
register32_r_en C3(.clk(clk),.reset_n(reset_n),.d_in(d_in),.d_out(d_out3),.en(en[3]));
register32_r_en C4(.clk(clk),.reset_n(reset_n),.d_in(d_in),.d_out(d_out4),.en(en[4]));
register32_r_en C5(.clk(clk),.reset_n(reset_n),.d_in(d_in),.d_out(d_out5),.en(en[5]));
register32_r_en C6(.clk(clk),.reset_n(reset_n),.d_in(d_in),.d_out(d_out6),.en(en[6]));
register32_r_en C7(.clk(clk),.reset_n(reset_n),.d_in(d_in),.d_out(d_out7),.en(en[7]));
//instance 8 register32 for registerFile
endmodule 