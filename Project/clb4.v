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
	_and2 U0_and(.a(a[0]),.b(b[0]),.y(g[0]));
	_and2 U1_and(.a(a[1]),.b(b[1]),.y(g[1]));
	_and2 U2_and(.a(a[2]),.b(b[2]),.y(g[2]));
	_and2 U3_and(.a(a[3]),.b(b[3]),.y(g[3]));
	
	// Propagate
	_or2 U0_or(.a(a[0]),.b(b[0]),.y(p[0]));
	_or2 U1_or(.a(a[1]),.b(b[1]),.y(p[1]));
	_or2 U2_or(.a(a[2]),.b(b[2]),.y(p[2]));
	_or2 U3_or(.a(a[3]),.b(b[3]),.y(p[3]));
	
	// c1 = g0+(p0*ci)
	
	_and2 C1_and(.a(p[0]),.b(ci),.y(w0_c1));
	_or2  C1_or(.a(g[0]),.b(w0_c1),.y(c1));
	
	// c2 = g1+(p1*c1) = g1+(p1g0)+(p1p0ci)
	
	_and3 C2_and3(.a(p[1]),.b(p[0]),.c(ci),.y(w0_c2));
	_and2 C2_and2(.a(p[1]),.b(g[0]),.y(w1_c2));
	_or3 C2_or3(.a(w0_c2),.b(w1_c2),.c(g[1]),.y(c2));
	
	// c3 = g2+(p2g1)+(p2p1g0)+(p2p1p0ci)
	
	_and4 C3_and4(.a(p[2]),.b(p[1]),.c(p[0]),.d(ci),.y(w0_c3));
	_and3 C3_and3(.a(p[2]),.b(p[1]),.c(g[0]),.y(w1_c3));
	_and2 C3_and2(.a(p[2]),.b(g[1]),.y(w2_c3));
	_or4 C3_or4(.a(w0_c3),.b(w1_c3),.c(w2_c3),.d(g[2]),.y(c3));
	
	// co = g3+(p3g2)+(p3p2g1)+(p3p2p1g0)+(p3p2p1p0ci)
	_and5 Co_and5(.a(p[3]),.b(p[2]),.c(p[1]),.d(p[0]),.e(ci),.y(w0_co));
	_and4 Co_and4(.a(p[3]),.b(p[2]),.c(p[1]),.d(g[0]),.y(w1_co));
	_and3 Co_and3(.a(p[3]),.b(p[2]),.c(g[1]),.y(w2_co));
	_and2 Co_and2(.a(p[3]),.b(g[2]),.y(w3_co));
	_or5 Co_or5(.a(w0_co),.b(w1_co),.c(w2_co),.d(w3_co),.e(g[3]),.y(co));
	
	endmodule 
	