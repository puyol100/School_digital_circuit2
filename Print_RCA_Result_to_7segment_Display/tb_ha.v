`timescale 1ns/100ps//Setting scale of time

module tb_ha; //module of half adder testbench
	reg tb_a, tb_b; //input value for test
	wire tb_s, tb_co; // output value for test
	
	ha U0_ha(.a(tb_a),.b(tb_b),.s(tb_s),.co(tb_co)); // link with halfadder module
	
	initial
	begin //Setting the testbench value
		tb_a=0; tb_b=0;
		#10; tb_a=0; tb_b=1; //Delay of 10 time unit
		#10; tb_a=1; tb_b=0;
		#10; tb_a=1; tb_b=1;
		#10; $stop;
		end //end the test
endmodule //end the testbench module