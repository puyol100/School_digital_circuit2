`timescale 1ns/100ps//Setting the time

module tb_fa;//module of Full adder testbench
reg tb_a, tb_b, tb_ci;//register for testbench's input
wire tb_s, tb_co;//wire for testbench's output 

fa U0_fa(.a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), . co(tb_co));//link with fulladder

initial
begin //start testbench 
tb_a = 0; tb_b= 0; tb_ci = 0;//input 0 0 0
#10; tb_a = 0; tb_b= 0; tb_ci = 1;
#10; tb_a = 0; tb_b= 1; tb_ci = 0;
#10; tb_a = 0; tb_b= 1; tb_ci = 1;
#10; tb_a = 1; tb_b= 0; tb_ci = 0;
#10; tb_a = 1; tb_b= 0; tb_ci = 1;
#10; tb_a = 1; tb_b= 1; tb_ci = 0;
#10; tb_a = 1; tb_b= 1; tb_ci = 1;
#10; $stop;//stop
end//end testbench
endmodule 