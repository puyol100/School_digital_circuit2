// clb4
module clb4(a,b,ci,c1,c2,c3,co);
   input [3:0] a, b;
   input ci;
   output c1, c2, c3, co;
   
   wire [3:0] g, p; // generate, propagate
   wire w0_c1;
   wire w0_c2, w1_c2;
   wire w0_c3, w1_c3, w2_c3;
   wire w0_co, w1_co, w2_co, w3_co;
   
   // Generate
   _and2 U0_and2(.a(a[0]),.b(b[0]),.y(g[0]));
   _and2 U1_and2(.a(a[1]),.b(b[1]),.y(g[1]));
   _and2 U2_and2(.a(a[2]),.b(b[2]),.y(g[2]));
   _and2 U3_and2(.a(a[3]),.b(b[3]),.y(g[3]));
   
   // Propagate
   _or2 U0_or2(.a(a[0]),.b(b[0]),.y(p[0]));
   _or2 U1_or2(.a(a[1]),.b(b[1]),.y(p[1]));
   _or2 U2_or2(.a(a[2]),.b(b[2]),.y(p[2]));
   _or2 U3_or2(.a(a[3]),.b(b[3]),.y(p[3]));
   
   // c1 = g0 | (P[0] & Ci);
   
   _and2 A0_and2(.a(p[0]),.b(ci),.y(w0_c1));
   _or2  A1_or2(.a(g[0]),.b(w0_c1),.y(c1));
   
   // c2 = g[1]
	//     | (p[1] & g[0])
   //		 | (p[1] & p[0] & ci);
	_and2 B1_and2(.a(p[1]),.b(g[0]),.y(w0_c2));
   _and3 B0_and3(.a(p[1]),.b(p[0]),.c(ci),.y(w1_c2));
   _or3  B2_or3(.a(g[1]), .b(w0_c2), .c(w1_c2), .y(c2));
   
   // c3 = g[2] 
	//		| (p[2] & g[1])
   //		| (p[2] & p[1] & g[0])
	//		| (p[2] & p[1] & p[0] & ci);
   _and2 C0_and2(.a(p[2]), .b(g[1]), .y(w0_c3));
	_and3 C1_and3(.a(p[2]), .b(p[1]), .c(g[0]), .y(w1_c3));
	_and4 C2_and4(.a(p[2]), .b(p[1]), .c(p[0]), .d(ci), .y(w2_c3));
	_or4  C3_or4(.a(g[2]), .b(w0_c3), .c(w1_c3), .d(w2_c3), .y(c3));
   // co = g[3]
	// 	 | (p[3] & g[2])
	//		 | (p[3] & p[2] & p[1])
	//		 |	(p[3] & p[2] & p[1] & g[0])
	//		 | (p[3] & p[2] & p[1] & p[0] & ci);
  	_and2 D0_and2(.a(p[3]), .b(g[2]), .y(w0_co));
	_and3 D1_and3(.a(p[3]), .b(p[2]), .c(g[1]), .y(w1_co));
	_and4 D2_and4(.a(p[3]), .b(p[2]), .c(p[1]), .d(g[0]), .y(w2_co));
	_and5 D3_and5(.a(p[3]), .b(p[2]), .c(p[1]), .d(p[0]), .e(ci), .y(w3_co));
	_or5  D4_or5(.a(g[3]), .b(w0_co), .c(w1_co), .d(w2_co), .e(w3_co), .y(co));
   
   endmodule 
   