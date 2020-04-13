`timescale 1ns/100ps

module tb_bus;
	reg 				clk,reset_n; //clk, reset
	//master 0 inputs & output
	reg 				M0_req, M0_wr;
	reg 	[7:0] 	M0_address;
	reg 	[31:0] 	M0_dout;
	wire 				M0_grant;
	//master 1 inputs & output
	reg 				M1_req, M1_wr;
	reg 	[7:0] 	M1_address;
	reg 	[31:0] 	M1_dout;
	wire 				M1_grant;
	wire 	[31:0] 	M_din;
	//slave inputs & output
	wire 				S0_sel, S1_sel;
	wire 	[7:0] 	S_address;
	wire				S_wr;
	wire 	[31:0] 	S_din;
	reg 	[31:0] 	S0_dout, S1_dout;

	parameter STEP = 10;
// bus(clk,reset_n,M0_req,M0_wr,M0_address,M0_dout,M1_req,M1_wr,M1_address,M1_dout,S0_dout,S1_dout,M0_grant,M1_grant,M_din,S0_sel,S1_sel,S_address,S_wr,S_din);
	bus U0_bus(.clk(clk),.reset_n(reset_n),.M0_req(M0_req),.M0_wr(M0_wr),
	.M0_address(M0_address),.M0_dout(M0_dout),.M1_req(M1_req),.M1_wr(M1_wr),.M1_address(M1_address),
	.M1_dout(M1_dout),.S0_dout(S0_dout),.S1_dout(S1_dout),.M0_grant(M0_grant),.M1_grant(M1_grant),.M_din(M_din),
	.S0_sel(S0_sel),.S1_sel(S1_sel),.S_address(S_address),.S_wr(S_wr),.S_din(S_din));

//testbench start
	always#(STEP/2) clk = ~clk; //clock pulse
	initial
	begin
		clk =1; reset_n=0; 
		M0_req = 0; M1_req = 0; 
		M0_wr = 0; M1_wr = 0;
		M0_address= 8'b0; M1_address = 8'b0; 
		M0_dout = 32'b0; M1_dout = 32'b0;
		S0_dout = 32'b0; S1_dout = 32'b0;
		#(STEP) reset_n =1;
		#(STEP) S0_dout = 32'h0000_0001; S1_dout = 32'h0000_0002;
		#(STEP-2) M0_req = 1;
		#(STEP) M0_wr = 1;
		#(STEP) M0_address = 8'h0_1; M0_dout = 32'h0000_0002;
		#(STEP) M0_address = 8'h0_2; M0_dout = 32'h0000_0004;
		#(STEP) M0_address = 8'h0_3; M0_dout = 32'h0000_0006;
		#(STEP) M0_address = 8'h2_0; M0_dout = 32'h0000_0020;
		#(STEP) M0_address = 8'h2_1; M0_dout = 32'h0000_0022;
		#(STEP) M0_address = 8'h2_2; M0_dout = 32'h0000_0024;
		#(STEP) M0_address = 8'h2_3; M0_dout = 32'h0000_0026;
		#(STEP) M0_address = 8'ha_0; M0_dout = 32'h0000_00ff;
		#(STEP*2) $stop;
	end
endmodule

      