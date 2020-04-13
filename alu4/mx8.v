module mx8 (a,b,c,d,e,f,g,h,s2,s1,s0,y);//8input mux
	input a,b,c,d,e,f,g,h;
	input s2,s1,s0;
	output y;
	//module mx2(d0, d1, s, y);
	wire w0,w1,w2,w3,w4,w5;
	
	mx2 M0(.d0(a),.d1(b),.s(s0),.y(w0));
	mx2 M1(.d0(c),.d1(d),.s(s0),.y(w1));
	mx2 M2(.d0(e),.d1(f),.s(s0),.y(w2));
	mx2 M3(.d0(g),.d1(h),.s(s0),.y(w3));
	mx2 M4(.d0(w0),.d1(w1),.s(s1),.y(w4));
	mx2 M5(.d0(w2),.d1(w3),.s(s1),.y(w5));
	mx2 M6(.d0(w4),.d1(w5),.s(s2),.y(y));
	//instances 7 mux2 for 8input mux
	endmodule
	