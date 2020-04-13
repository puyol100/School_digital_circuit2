`timescale 1ns/100ps//setting time scale

module tb_rca_clk;
	reg			clock;//for clock signal
	reg  [31:0] tb_a, tb_b;
	reg 			tb_ci;
	wire [31:0] tb_s_rca;
	wire 			tb_co_rca;
	
	
	parameter STEP = 10;//set the parameter 10ns
	
	rca_clk U0_rca_clk(.clock(clock), .a(tb_a),.b(tb_b), .ci(tb_ci),.s_rca(tb_s_rca),.co_rca(tb_co_rca));
	
	always# (STEP/2) clock = ~clock;//every 5ns ivert clock signal 
	

	initial
	begin//start test
				
		clock = 1'b1;	
		tb_a = 32'h0;				tb_b = 32'h0;				tb_ci = 1'b0;
		#(STEP);		tb_a = 32'hFFFF_FFFF;	tb_b = 32'h0;				tb_ci = 1'b1;
		#(STEP);		tb_a = 32'h0000_FFFF;	tb_b = 32'hFFFF_0000;	tb_ci = 1'b0;
		#(STEP);		tb_a = 32'h135f_a562;	tb_b = 32'h3561_4642;	tb_ci = 1'b0;
		#(STEP*2);	   $stop;
			
	end
	
	endmodule
	