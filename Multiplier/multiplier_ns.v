module multiplier_ns(clk,state,reset_n,op_clear,op_start,op_done);//module for state
	input op_start,op_clear,op_done;//input signal for start, clear, done
	input reset_n;//signal for reset
	input clk;//signal for clock 
	output reg [1:0] state;//output for state
	parameter IDLE = 2'b00;
	parameter EXEC = 2'b01;
	parameter DONE = 2'b10;//Binary encoding
always @(posedge clk, negedge reset_n)
	begin 
		if(~reset_n) state <= IDLE;//when reset signal inputting
		else begin//else 
			case(state)//case for state
			IDLE : //IDLE state
			if(op_start) 	state <= EXEC;//next state is EXEC
			else 				state <= IDLE;//next state is IDLE
			EXEC : //EXEC state
			if (op_clear) 			state <= IDLE;//next state is IDLE
			else if(op_done) 		state <= DONE;//next state is DONE
			else 						state <= EXEC;//next state is EXEC
			DONE : //DONE state
			if (op_done || op_clear) 	state <= IDLE;//next state is IDLE
			else 								state <= DONE;//next state is DONE
			default : 						state <= 2'bxx;//exception
			endcase
		end
	end
endmodule 