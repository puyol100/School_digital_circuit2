module clb4(a,b,ci,c1,c2,c3,co);//clb block module
   input [3:0]a,b;//4bits a, b
	input ci;//carry in
   output c1,c2,c3,co;//outputs
   wire [3:0] g,p;//generate, propagate
	
	wire w0_c1;
	wire w0_c2, w1_c2;
	wire w0_c3, w1_c3, w2_c3;
	wire w0_co, w1_co, w2_co, w3_co;
   //wires
	
   _and2 U0_and2(.a(a[0]),.b(b[0]),.y(g[0]));//generate 0
   _and2 U1_and2(.a(a[1]),.b(b[1]),.y(g[1]));//generate 1
   _and2 U2_and2(.a(a[2]),.b(b[2]),.y(g[2]));//generate 2
   _and2 U3_and2(.a(a[3]),.b(b[3]),.y(g[3]));//generate 3
   
   _or2 U4_or2(.a(a[0]),.b(b[0]),.y(p[0]));//propagate 0
   _or2 U5_or2(.a(a[1]),.b(b[1]),.y(p[1]));//propagate 1
   _or2 U6_or2(.a(a[2]),.b(b[2]),.y(p[2]));//propagate 2
   _or2 U7_or2(.a(a[3]),.b(b[3]),.y(p[3]));//propagate 3
  
  //c1 = Generate[0] | (Propagate[0] & carry in)
   _and2 U8_and2(.a(p[0]),.b(ci),.y(w0_c1));
   _or2  U9_or2(.a(g[0]),.b(w0_c1),.y(c1));
   
	//c2 = Generate[1] | (Propagate[1] & Generate[0]) | (Propagate[1] & Propagate[0] & carry in)
   _and2 U9_and2(.a(p[1]),.b(g[0]),.y(w0_c2));
   _and3 U11_and3(.a(p[1]),.b(p[0]),.c(ci),.y(w1_c2));
   _or3  U12_or3(.a(g[1]),.b(w0_c2),.c(w1_c2),.y(c2));
   
	//c3 = Generate[1] | (Propagate[2] & Generate[1]) |(Propagate[2] & Propagate[1] & Generate[0]) | (Propagate[2] & Propagate[1] & Propagate[0] & carry in)
   _and2 U13_and2(.a(p[2]),.b(g[1]),.y(w0_c3));
   _and3 U14_and3(.a(p[2]),.b(p[1]),.c(g[0]),.y(w1_c3));
   _and4 U15_and4(.a(p[2]),.b(p[1]),.c(p[0]),.d(p[0]),.y(w2_c3));
   _or4  U16_or4(.a(g[2]),.b(w0_c3),.c(w1_c3),.d(w2_c3),.y(c3));
   
	//carry out = Generate[3] | 
	//(Propagate[3] & Propagate[2] & Generate[1]) | 
	//(Propagate[3] & Propagate[2] & Propagate[1] & Generate[0]) | 
	//(Propagate[3] & Propagate[2] & Propagate[1] & Propagate[0] & carry in)
   _and2 U17_and2(.a(p[3]),.b(g[2]),.y(w0_co));
   _and3 U18_and3(.a(p[3]),.b(p[2]),.c(g[1]),.y(w1_co));
   _and4 U19_and4(.a(p[3]),.b(p[2]),.c(p[1]),.d(g[0]),.y(w2_co));
   _and5 U20_and5(.a(p[3]),.b(p[2]),.c(p[1]),.d(p[0]),.e(ci),.y(w3_co));
   _or5  U21_or4(.a(g[3]),.b(w0_co),.c(w1_co),.d(w2_co),.e(w3_co),.y(co));
   
   endmodule
   