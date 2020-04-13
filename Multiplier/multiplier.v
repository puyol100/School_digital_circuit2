module multiplier(clk,reset_n,multiplicand,multiplier,op_start,op_clear,result,op_done);//top module of multiplier 
	input clk,reset_n,op_start,op_clear;
	input [31:0] multiplicand,multiplier;//input multiplicand, multiplier
	output [63:0] result;//output result
	wire [1:0] state;//wire for state
	output op_done;//output for op_done
	wire [31:0] U,V;//U ,V for mutiplication
	parameter IDLE = 2'b00;
	parameter EXEC = 2'b01;
	parameter DONE = 2'b10;//Binary encoding
//multiplier_ns(clk,state,reset_n,op_clear,op_start);
multiplier_ns U0(.clk(clk),.state(state),.reset_n(reset_n),.op_clear(op_clear),.op_start(op_start),.op_done(op_done));
//multiplier_os(state,u,v,result); 
multiplier_os U1(.state(state),.U(U),.V(V),.result(result));
//multiplier_operation(clk,state,multiplicand,multiplier,op_done,U,V);
multiplier_operation U2(.clk(clk),.state(state),.multiplicand(multiplicand),.multiplier(multiplier),.op_done(op_done),.U(U),.V(V));	
endmodule 