`timescale 1ns/100ps
module tb_multiplier;
	reg tb_clk,tb_reset_n,tb_op_start,tb_op_clear;
	reg [31:0] tb_multiplicand,tb_multiplier;
	wire [63:0] tb_result;
	wire tb_op_done;
	parameter IDLE = 2'b00;
	parameter EXEC = 2'b01;
	parameter DONE = 2'b10;	
multiplier S0(.clk(tb_clk),.reset_n(tb_reset_n),.multiplicand(tb_multiplicand),.multiplier(tb_multiplier),.op_start(tb_op_start),.op_clear(tb_op_clear),.result(tb_result),.op_done(tb_op_done));

always
begin
	#1;	tb_clk = 0;	#1;	tb_clk=1;//clock pulse 
end

initial
begin
	tb_clk =0;tb_reset_n = 0;
	#5; tb_op_start = 0; tb_op_clear=0;
	tb_multiplicand = 32'h00000007; tb_multiplier = 32'h00000032;//setting first value
	#10; tb_reset_n =1'b1; tb_op_start = 1'b1;
	#37; tb_multiplicand = 32'h0000000b; tb_multiplier = 32'h00000005;
	#37; tb_multiplicand = 32'h00000026; tb_multiplier = 32'h00000031;
	#37; tb_multiplicand = 32'h00000038; tb_multiplier = 32'h00000049;
	#300;	$stop;
end

endmodule 
