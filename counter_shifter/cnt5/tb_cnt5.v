`timescale 1ns/100ps//setting timescale
module tb_cnt5;//testbench for count 5
	reg tb_clk, tb_reset_n, tb_inc;// input value
	wire [2:0] tb_cnt;//output count
cnt5	A0_tb_cnt5(.cnt(tb_cnt),.clk(tb_clk),.reset_n(tb_reset_n),.inc(tb_inc));//instance cnt5 for testbench
parameter STEP = 10;//setting parameter
always
begin
#(STEP/2) tb_clk = ~tb_clk;
end//making clok pulse
initial
	begin// start
		tb_clk =0; tb_reset_n = 0; tb_inc = 0; //setting initial value
		#(STEP); tb_reset_n =1;//active
		#(STEP); tb_inc = 1;//increase test
		#(STEP); tb_inc = 1;
		#(STEP); tb_inc = 1;
		#(STEP); tb_inc = 1;
		#(STEP); tb_inc = 0;//decrease test
		#(STEP); tb_inc = 0;
		#(STEP); tb_inc = 0;
		#(STEP); tb_inc = 0;
		#(STEP); tb_reset_n = 0;//reset test
		#(STEP*2); $stop;
	end//end
	
endmodule 
