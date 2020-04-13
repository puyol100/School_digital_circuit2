module  shifter8(clk, reset_n, op, shamt, d_in, d_out);
	input clk,reset_n;
	input [2:0] op;//opertaion
	input [1:0] shamt;//shift amount
	input [7:0] d_in;
	output [7:0] d_out;
	wire [7:0] wd_out;
	//module _register8_r(clk, reset_n, d, q);
_register8_r B0_register8_r(.clk(clk),.reset_n(reset_n),.d(wd_out),.q(d_out));
//module cc_logic(op, shamt, d_in, d_out, do_next);
cc_logic B1_cc_logic(.op(op),.shamt(shamt),.d_in(d_in),.d_out(d_out),.do_next(wd_out));	
	
endmodule 
