module mul_fifo_cal(state, head, tail, data_count, we, re, next_head, next_tail, next_data_count);//fifo for calculate
   input[2:0]         state, head, tail;
   input[3:0]         data_count;//input state
   output reg         we, re;
   output reg[2:0]   next_head, next_tail;
   output reg[3:0]   next_data_count;//output states
   parameter   INIT      = 3'b000;
   parameter   NO_OP      = 3'b001;
   parameter   WRITE      = 3'b010;
   parameter   WR_ERROR   = 3'b011;
   parameter   READ      = 3'b100;
   parameter   RD_ERROR   = 3'b101;//setting parameter
   always @ (*) begin
      case(state)//case by state
         INIT: begin//case INIT
            we = 0;
            re = 0;
            next_head = 0;
            next_tail = 0;
            next_data_count = 0;end
        WRITE      : begin//case write
            we = 1;
            if (data_count != 0) re = 1;
            else                  re = 0;
            next_head = head;
            next_tail = tail + 3'b001;
            next_data_count = data_count + 4'h1;
				end
        NO_OP : begin//case NO_OP
            we = 0;
            if (data_count != 0) re = 1;
            else                  re = 0;
            next_head = head;
            next_tail = tail;
            next_data_count = data_count;
         end
          READ      : begin//case read
            we = 0;
            re = 1;
            next_head = head + 3'b001;
            next_tail = tail;
            next_data_count = data_count - 4'h1;
         end
          WR_ERROR   : begin//case wr_ERROR
            we = 0;
            re = 1;
            next_head = head;
            next_tail = tail;
            next_data_count = data_count;
         end
         RD_ERROR   : begin//case RD_ERROR
            we = 0;
            re = 0;
            next_head = head;
            next_tail = tail;
            next_data_count = data_count;
         end
         default   : begin
            we = 1'bx;
            re = 1'bx;
            next_head = 3'bx;
            next_tail = 3'bx;
            next_data_count = 4'bx;
         end
      endcase
   end
endmodule 