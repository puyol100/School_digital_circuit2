module multiplier_os(state,U,V,result);//module for output 
	input [31:0] U,V;//vaue of calculating
	input [1:0] state;//input state
	output reg [63:0] result;//output for result
	parameter IDLE = 2'b00;
	parameter EXEC = 2'b01;
	parameter DONE = 2'b10;//binary encoding
	always @ (*)begin
		case(state)
			IDLE: begin
				result <= 64'd0;
				end
			EXEC: begin
				result <= {U,V};
			end	
			DONE: begin
				result <= {U,V};
				end
			default: begin
				result <= 64'dx;
			end
		endcase
	end// Output multiplication result each step
endmodule 