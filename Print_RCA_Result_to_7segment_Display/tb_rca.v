
`timescale 1ns/100ps

module tb_rca;//Setting testbench of rca module
reg [3:0] tb_a,tb_b;
reg tb_ci;
wire [3:0] tb_s;
wire tb_co;
wire [4:0] tb_result;//set 5bit for result
rca U0_rca (.a(tb_a), .b(tb_b), .ci(tb_ci), .s(tb_s), .co(tb_co));//link rca for testbench

initial //directed verification
begin
	tb_a = 4'h0; tb_b = 4'h0; tb_ci = 0;//star
	#10; tb_a = 4'h5;tb_b = 4'h4;
	#10; tb_a = 4'hF;tb_b = 4'hF; 
	#10; tb_ci = 1;
	#10; $stop;
end
assign tb_result = {tb_co,tb_s}; //result
endmodule