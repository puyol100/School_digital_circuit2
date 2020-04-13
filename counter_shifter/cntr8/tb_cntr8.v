`timescale 1ns/100ps
module tb_cntr8;
	reg tb_clk, tb_reset_n, tb_inc, tb_load; 
	reg [7:0] tb_d_in;
	wire [7:0] tb_d_out;
	wire [2:0] tb_o_state;
//module cntr8(clk, reset_n, inc, load, d_in, d_out, o_state);
cntr8 U0_cntr8(.clk(tb_clk),.reset_n(tb_reset_n),.inc(tb_inc),.load(tb_load),.d_in(tb_d_in),.d_out(tb_d_out),.o_state(tb_o_state));
always 
	begin 
	#5;	tb_clk = ~tb_clk;
	end//making clock pulse
	
initial
begin//start test
 tb_clk=1; tb_reset_n=0;tb_inc=0;tb_d_in=8'h00;tb_load=0;
#22.5; tb_reset_n=1;tb_inc=1;
#50; tb_inc=0;
#50; tb_load=1;tb_d_in=8'h44;
#20; tb_load=0;tb_d_in=8'h00;tb_inc=1;
#40; tb_inc=0;tb_reset_n=0;
#10; tb_reset_n=1;
#40; $stop;

	end
endmodule 