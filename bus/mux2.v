module mux2(d,b,s,y);//mux2 module
	input  d;			//input value
	input  b;			//input value
	input s;				//select bit
	output reg  y;		//output value

	always @ (s,d,b)
		begin
			if(s == 1)	y <= d;		//if s == 1 make output d
			else      	y <= b;			//output data b
		end
endmodule		