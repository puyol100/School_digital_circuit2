module alu4(a,b,op,result,c,n,z,v);//module for Arithmetic Logic Unit
input [3:0] a,b;//4bits input
input [2:0] op;//for opcode
output [3:0] result;
output c,n,z,v;

wire [3:0] w_not_a,w_not_b,w_and,w_or,w_xor,w_xnor,w_add,w_sub;
wire c3_add, co_add, c3_sub, co_sub;

//_inv(a,y);//inveter module
_inv_4bits A0(.a(a),.y(w_not_a));//for input a invert
_inv_4bits A1(.a(b),.y(w_not_b));//for input b invert
_and2_4bits A2(.a(a),.b(b),.y(w_and));//for a and b 
_or2_4bits A3(.a(a),.b(b),.y(w_or));//for a or b
_xor2_4bits A4(.a(a),.b(b),.y(w_xor));//for a xor b
_xnor2_4bits A5(.a(a),.b(b),.y(w_xnor));//for a xnor b	

cla4_ov B0(.a(a),.b(b),.ci(0),.s(w_add),.c3(c3_add),.co(co_add));//for addition 
cla4_ov B1(.a(a),.b(w_not_b),.ci(1),.s(w_sub),.c3(c3_sub),.co(co_sub));//for subtraction

mx8_4bits M0(.a(w_not_a),.b(w_not_b),.c(w_and),.d(w_or),.e(w_xor),.f(w_xnor),.g(w_add),.h(w_sub),.s2(op[2]),.s1(op[1]),.s0(op[0]),.y(result));
//8 to 1 mux
cal_flags4 F0(.op(op),.result(result),.co_add(co_add),.c3_add(c3_add),.co_sub(co_sub),.c3_sub(c3_sub),.c(c),.n(n),.z(z),.v(v));
//for cal flags

endmodule
