module fifo(clk,reset_n,rd_en,wr_en,din,dout,data_count,full,empty,wr_ack,wr_err,rd_ack,rd_err);//fifo
	input clk, reset_n, rd_en, wr_en;
	input [31:0]din;//input data
	output [31:0]dout;//output data
	output full,empty;//full and empty signal
	output wr_ack,wr_err,rd_ack,rd_err;//handshake signal
	output [3:0]data_count;//for data counting
	wire [2:0]head,next_head;
	wire [2:0]tail,next_tail;
	wire [2:0]state,next_state;
	wire [3:0]next_data_count;
	wire we,re;
	wire [31:0]to_mux,to_ff;
	parameter INIT      =3'b000;
   parameter NO_OP   =3'b001;
   parameter WRITE   =3'b010;
   parameter WR_ERROR=3'b011;
   parameter READ      =3'b100;
   parameter RD_ERROR=3'b101;
	//Binary encoded
Register_file	U0_FIFO(.clk(clk), .reset_n(reset_n), .wAddr(tail), .wData(din), .we(we), .rAddr(head), .rData(to_mux));
//Instance for register_file
fifo_ns U0_ns(.rd_en(rd_en),.wr_en(wr_en),.state(state),.data_count(data_count),.next_state(next_state));
//instance for fifo next state logic
fifo_cal U1_cal(.state(next_state),.data_count(data_count),.head(head),.tail(tail),.re(re),.we(we),.next_data_count(next_data_count),.next_head(next_head),.next_tail(next_tail));
//instance for fifo calculate logic
fifo_out U2_out(.state(state),.data_count(data_count),.empty(empty),.full(full),.rd_ack(rd_ack),.rd_err(rd_err),.wr_ack(wr_ack),.wr_err(wr_err));
//instance for fifo output logic
_dff_4_r U3_data_count(.clk(clk),.reset_n(reset_n),.d(next_data_count),.q(data_count));
//dff for data_count
_dff_3_r U4_state(.clk(clk),.reset_n(reset_n),.d(next_state),.q(state));
//dff for state
_dff_3_r U5_head(.clk(clk),.reset_n(reset_n),.d(next_head),.q(head));	
//dff for head
_dff_3_r U6_tail(.clk(clk),.reset_n(reset_n),.d(next_tail),.q(tail));
//dff for tail
_dff_32 U0_dff(.clk(clk),.d(to_ff),.q(dout));	
//dff for 32bit 
mx2  MUX21 (.d(to_mux),.s(re),.y(to_ff));
endmodule 