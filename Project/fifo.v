module fifo(clk, reset_n, opclear, din, wr_en, rd_en, dout, data_count);//fifo 
   input  clk, reset_n, opclear, wr_en, rd_en;//fifo input signal
   input[31:0]         din;//din value
   output reg[3:0]   data_count;//output for data_count
   output reg[31:0]   dout;//data out value
   reg[2:0]         head, tail, state;//register for store head, tail address and state
   wire[2:0]      next_head, next_tail, next_state;
   wire[3:0]      next_data_count;
   wire            we, re;//write and read enable signal
   wire[31:0]      to_mux, to_ff;//wires for link
   always @ (posedge clk or negedge reset_n) begin//reacted by clk, reset_n
      if (~reset_n) begin
         state = 0;
         data_count = 0;
         head = 0;
         tail = 0;
         dout = 0;end//if reset 
      else begin
         state = next_state;
         data_count = next_data_count;
         head = next_head;
         tail = next_tail;
         dout = to_ff;end
   end
   assign to_ff = re ? to_mux : 32'h00000000;
   RF     U2_RF(.clk(clk), .clear(opclear), .we(we), .wData(din), .wAddr(tail), .rAddr(head), .rData(to_mux));
	mul_fifo_ns            U0_fifo_ns(.opclear(opclear), .wr_en(wr_en), .rd_en(rd_en), .state(state),.data_count(data_count), .next_state(next_state));
   mul_fifo_cal      U1_fifo_cal_addr(.state(next_state), .head(head), .tail(tail), .data_count(data_count),.we(we), .re(re), .next_head(next_head), .next_tail(next_tail), .next_data_count(next_data_count)); 
endmodule
 