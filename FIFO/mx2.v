module mx2(d, s, y);
	input [31:0] d;			//32bits data
	input s;						//select bit
	output reg [31:0] y;

	always @ (s, d)
		begin
			if(s == 0)	y <= 32'h0;		//if s == 0 make output 0
			else			y <= d;			//output data
		end
endmodule		