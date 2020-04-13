module ns_logic(load, inc, state, next_state);//next_state logic
	parameter IDLE_STATE = 3'b000;
	parameter LOAD_STATE = 3'b001;
	parameter INC_STATE = 3'b010;
	parameter INC2_STATE = 3'b011;
	parameter DEC_STATE = 3'b100;
	parameter DEC2_STATE = 3'b101;
	//parameter state
	
	input 	load, inc;
	input  [2:0] state;
	output [2:0] next_state;//output for nex_state
	reg	 [2:0] next_state;

always @ (load, inc, state)//decide next state
	begin
	if(load == 1) begin next_state <= LOAD_STATE; end//if load value == 1 next_state == loaD_STAT
	else begin
	case (state)
	IDLE_STATE 	:
	if(inc == 1) begin next_state <= INC_STATE; end
	else begin next_state <= DEC_STATE; end
	LOAD_STATE	:
	if(inc == 1) begin next_state <= INC_STATE; end
	else begin next_state <= DEC_STATE; end
	INC_STATE 	: 
	if(inc == 1) begin next_state <= INC2_STATE; end
	else begin next_state <= DEC_STATE; end
	INC2_STATE	:
	if(inc == 1) begin next_state <= INC_STATE; end
	else begin next_state <= DEC_STATE; end
	DEC_STATE		:
	if(inc == 1) begin next_state <= INC_STATE; end
	else begin next_state <= DEC2_STATE; end
	DEC2_STATE 	:
	if(inc == 1) begin next_state <= INC_STATE; end
	else begin next_state <= DEC_STATE; end
	default			: next_state <= 3'bx;
	endcase
	end
end
endmodule 
	