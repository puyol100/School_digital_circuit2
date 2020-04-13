module register32_r_en(clk,reset_n,d_in,d_out,en);//32bit register
	input clk, reset_n, en;
	input [31:0]d_in;
	output [31:0]d_out;
	//module register8_r_en(clk,reset_n,d_in,d_out,en);
register8_r_en B0(.clk(clk),.reset_n(reset_n),.d_in(d_in[7:0]),.d_out(d_out[7:0]),.en(en));
register8_r_en B1(.clk(clk),.reset_n(reset_n),.d_in(d_in[15:8]),.d_out(d_out[15:8]),.en(en));
register8_r_en B2(.clk(clk),.reset_n(reset_n),.d_in(d_in[23:16]),.d_out(d_out[23:16]),.en(en));
register8_r_en B3(.clk(clk),.reset_n(reset_n),.d_in(d_in[31:24]),.d_out(d_out[31:24]),.en(en));
	//instance 4 register8 for 32bit register
endmodule 