module mux5_32bit(d0, d1, d2, d3, d4, s, y);//mx5 for 32bit
   input [31:0] d0, d1, d2, d3, d4;//input 5 32bit
   input [3:0] s;  //select signal
   output reg[31:0] y;//output 
   always@(*)///////
   begin
		if(s==4'b1000) y<=d1;//s0,s1,s2,s3 3'b000
		else if(s==4'b0100) y<=d2;//3'b001
		else if(s==4'b0010) y<=d3;//3'b010
		else if(s==4'b0001) y<=d4;//3'b011
		else y<=d0;
   end
endmodule 