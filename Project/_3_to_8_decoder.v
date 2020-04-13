module _3_to_8_decoder (d, q);//3to 8 decoder module
	input		 	[2:0] d;
	output reg	[7:0] q;
	
	//make 3bits value to 8bit hot-encoding
	always@(d) begin
		case(d)
			3'b000: q = 8'b00000001;
			3'b001: q = 8'b00000010;
			3'b010: q = 8'b00000100;
			3'b011: q = 8'b00001000;
			3'b100: q = 8'b00010000;
			3'b101: q = 8'b00100000;
			3'b110: q = 8'b01000000;
			3'b111: q = 8'b10000000;
			default : q = 8'bx;
		endcase
	end
endmodule