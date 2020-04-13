module mul_fifo_ns(opclear, wr_en, rd_en, state, data_count, next_state);//mul_fifo for ns
   input               opclear, wr_en, rd_en;
   input[2:0]         state;
   input[3:0]         data_count;//input value
   output reg[2:0]   next_state;//output for next_state
   parameter   INIT      = 3'b000;
   parameter   NO_OP      = 3'b001;
   parameter   WRITE      = 3'b010;
   parameter   WR_ERROR   = 3'b011;
   parameter   READ      = 3'b100;
   parameter   RD_ERROR   = 3'b101;//setting parameter
   always @ (*) begin
      if (opclear == 1'b1)
         next_state = INIT;
      else if (data_count == 0 && rd_en == 1 && wr_en == 0)
         next_state = RD_ERROR;
      else if (data_count == 8 && rd_en == 0 && wr_en == 1)
         next_state = WR_ERROR;
      else if (rd_en == 1 && wr_en == 0)
         next_state = READ;
      else if (rd_en == 0 && wr_en == 1)
         next_state = WRITE;
      else
         next_state = NO_OP;
   end
endmodule 