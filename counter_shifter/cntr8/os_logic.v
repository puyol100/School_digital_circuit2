module os_logic(state, d_in, d_out);//output state logic

	parameter IDLE_STATE = 3'b000;
	parameter LOAD_STATE = 3'b001;
	parameter INC_STATE = 3'b010;
	parameter INC2_STATE = 3'b011;
	parameter DEC_STATE = 3'b100;
	parameter DEC2_STATE = 3'b101;
	//parameter state 
	input [2:0]	state;//input for state
	input [7:0] d_in;//inpupt data
	output [7:0] d_out;//output data
	
	reg [7:0] d_out;
	wire [7:0] d_inc;
	wire [7:0] d_dec;
	
	always @(state)
	begin	
		case(state)
			IDLE_STATE : d_out <= 8'b00000000;
			LOAD_STATE : d_out <= d_in;
			INC_STATE  : d_out <= d_inc;
			INC2_STATE : d_out <= d_inc;
			DEC_STATE  : d_out <= d_dec;
			DEC2_STATE : d_out <= d_dec;
			default    : d_out <= 8'bxxxxxxxx;
		endcase 
	end 
	//cla8(a, b, ci, s, co);
	cla8 A0_cla8(.a(d_out),.b(8'b00000001),.ci(0),.s(d_inc),.co());
	cla8 A1_cla8(.a(d_out),.b(8'b11111111),.ci(0),.s(d_dec),.co());
	//instance cla8 for inc and dec 
endmodule 