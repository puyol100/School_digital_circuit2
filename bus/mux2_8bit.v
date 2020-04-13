module mux2_8bit(d,b,s,y);//mux2 for 8bit
	input [7:0] d;			//8bits data
	input [7:0] b;			//8bits
	input s;				//select bit
	output reg [7:0] y;//output 

	always @ (s,d,b)
		begin					//mux 
			if(s == 1)	y <= d;		//if s == 1 make output d
			else  	y <= b;			//output data	b
		end
endmodule 