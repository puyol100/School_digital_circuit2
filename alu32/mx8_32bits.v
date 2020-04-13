module mx8_32bits(a,b,c,d,e,f,g,h,s2,s1,s0,y);//mx8 for 32bits
input  [31:0] a,b,c,d,e,f,g,h;
input 		  s2,s1,s0;
output [31:0] y;

wire 	 [31:0] w0,w1,w2,w3,w4,w5;

mx2_32bits A0(.d0(a),.d1(b),.s(s0),.y(w0));
mx2_32bits A1(.d0(c),.d1(d),.s(s0),.y(w1));
mx2_32bits A2(.d0(e),.d1(f),.s(s0),.y(w2));
mx2_32bits A3(.d0(g),.d1(h),.s(s0),.y(w3));
mx2_32bits A4(.d0(w0),.d1(w1),.s(s1),.y(w4));
mx2_32bits A5(.d0(w2),.d1(w3),.s(s1),.y(w5));
mx2_32bits A6(.d0(w4),.d1(w5),.s(s2),.y(y));
//instances for mx8_32bits
endmodule
