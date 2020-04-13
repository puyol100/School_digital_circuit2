module mux3_32bit(d,b,e,s, y);//mux3 for 32bits
	input [31:0] d;			//32bits data
	input [31:0] b;			//32bits data
	input [31:0] e;			//32bits data
	input [1:0]s;						//select bit
	output reg [31:0] y;		//output data
	wire [31:0] m;				//wire for mux 2
//mux2_32bit(d,b,s, y);
mux2_32bit U0(.d(d),.b(b),.s(s[0]),.y(m));//first mux
	always @ (s[1],m,e)//second mux exec
		begin
			if(s[1] == 1'b1)	y <= m;		//if s == 1 make output m
			else 	 y <= e;			//output data	e
		end
endmodule 