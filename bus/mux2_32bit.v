module mux2_32bit(d,b,s,y);//mux2 for 32bit
	input [31:0] d;			//32bits data
	input [31:0] b;			//32bits
	input s;						//select bit
	output reg [31:0] y;	//output for 32bit

	always @ (s,d,b)
		begin
			if(s == 1)	y <= d;		//if s == 1 make output d
			else  	y <= b;			//output data	b
		end
endmodule 