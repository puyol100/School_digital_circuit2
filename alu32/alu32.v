module alu32(a,b,op,result,c,n,z,v);//32bits Arithmetic Logic Unit
input  [31:0]  a,b;//input
input  [2:0]   op;//opcode
output [31:0]  result;
output 			c,n,z,v;//flags

wire   [31:0]  w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_add, w_sub;
wire 				co_prev_add, co_add, co_prev_sub, co_sub;

_inv_32bits   U0(.a(a),.y(w_not_a));//invert a 
_inv_32bits   U1(.a(b),.y(w_not_b));//invert b
_and2_32bits  U2(.a(a),.b(b),.y(w_and));//for a and b value
_or2_32bits   U3(.a(a),.b(b),.y(w_or));//for a or b value
_xor2_32bits  U4(.a(a),.b(b),.y(w_xor));//for a xor b value
_xnor2_32bits U5(.a(a),.b(b),.y(w_xnor));//for a xnor b value
cla32_ov   A0(.a(a),.b(b),.ci(0),.s(w_add),.co_prev(co_prev_add),.co(co_add));//for addition 
cla32_ov   A1(.a(a),.b(w_not_b),.ci(1),.s(w_sub),.co_prev(co_prev_sub),.co(co_sub));//for subtraction
mx8_32bits B0(.a(w_not_a),.b(w_not_b),.c(w_and),.d(w_or),.e(w_xor),.f(w_xnor),.g(w_add),.h(w_sub),.s2(op[2]),.s1(op[1]),.s0(op[0]),.y(result));
//mux8 for 32bits
cal_flags32 C0(.op(op),.result(result),.co_add(co_add),.co_prev_add(co_prev_add),.co_sub(co_sub),.co_prev_sub(co_prev_sub),.c(c),.n(n),.z(z),.v(v));
//for cal flags
endmodule
