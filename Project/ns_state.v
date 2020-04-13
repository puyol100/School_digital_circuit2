module ns_state(reset_n, state, op_start, op_clear, exec_count_in, next_state);//ns state logic
input op_clear, op_start, reset_n;//input for signal
input [1:0] state;//input for state
input [3:0] exec_count_in;//input for exec count
output reg [1:0] next_state;//next state
parameter IDLE = 2'b00;
parameter EXEC = 2'b01;
parameter DONE   = 2'b10;//setting parameter (state)
always @(reset_n,op_clear,op_start,state,exec_count_in)// reacted by that signal
begin
   if(reset_n === 1'b0) begin next_state <= IDLE; end//reset_n
   else if(op_clear === 1'b1) begin next_state  <= IDLE; end//op_clear
   else if(exec_count_in === 4'b1111)begin next_state<= DONE; end//alculate over
   else begin                                                       
   case(state)//case by state
      IDLE   :   begin //case IDEL
         if(op_start === 1'b1)begin next_state <= EXEC;end
         else begin next_state  <= IDLE;end
      end
      EXEC   :  begin  //case EXEC
         if(exec_count_in !== 4'b1111)begin next_state<= EXEC;end
         else begin next_state <= DONE;end
      end
      DONE   : next_state  <= IDLE;// DONE state
      default   :next_state  <= 2'bx;//default
   endcase
   end
end


endmodule
