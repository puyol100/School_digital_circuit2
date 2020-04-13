module mx2(d0, d1, s, y);//two input mux
input d0,d1;
input s;//s for mux function
output y;
wire sb, w0, w1;

_inv A0(.a(s),.y(sb));
_nand2 U0(.a(d0),.b(sb),.y(w0));
_nand2 U1(.a(d1),.b(s),.y(w1));
_nand2 U2(.a(w0),.b(w1),.y(y));
//modules for mux
endmodule