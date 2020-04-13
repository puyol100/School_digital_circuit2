
module _inv(a,y);//inveter module
input a;//input
output y;//output
assign y = ~a; //Assign the input value to inverted value
endmodule

module _nand2(a,b,y);//nand module
input a,b;//input
output y;//output
assign y = ~(a&b);//Assign the (a and b) value to inverted value
endmodule

module _and2(a,b,y);//Two input and module
input a,b;//input
output y ;//output
assign y = a&b;
endmodule

module _or2(a,b,y);//Two input or module
input a,b;//input
output y;//output
assign y = a|b;
endmodule

module _xor2(a,b,y);//Exclusive or module
input a,b;//input
output y;//output
wire inv_a, inv_b;//wire for inveter value
wire w0, w1;
_inv U0_inv(.a(a), .y(inv_a));//invert value
_inv U1_inv(.a(b), .y(inv_b));//invert value
_and2 U2_and(.a(inv_a), .b(b), .y(w0));
_and2 U3_and(.a(a), .b(inv_b), .y(w1));
_or2 U4_or(.a(w0), .b(w1), .y(y));
endmodule

module _and3(a,b,c,y);//3input and
input a,b,c;//input
output y;//output
assign y=a&b&c;//assign and
endmodule

module _or3(a,b,c,y);//3input or
input a,b,c;//input
output y;//output
assign y=a|b|c;//assign or
endmodule

module _and4(a,b,c,d,y);//4input and
input a,b,c,d;//input
output y;//output
assign y=a&b&c&d;//assign output
endmodule

module _or4(a,b,c,d,y);//4input or
input a,b,c,d;//input
output y;//output
assign y=a|b|c|d;//assign or
endmodule

module _and5(a,b,c,d,e,y);//5input and
input a,b,c,d,e;//input
output y;//output
assign y=a&b&c&d&e;//assign and
endmodule

module _or5(a,b,c,d,e,y);//5input or
input a,b,c,d,e;//input
output y;//output
assign y=a|b|c|d|e;//assign or
endmodule

module _inv_4bits(a,y);//4bits invertor
input [3:0] a;//input
output[3:0] y;//output
assign y=~a;//assign invert
endmodule

module _xor2_4bits(a,b,y);//4bits exclusive or
input[3:0] a,b;//input
output[3:0] y;//output
_xor2 U0_xor2(.a(a[0]),.b(b[0]),.y(y[0]));
_xor2 U1_xor2(.a(a[1]),.b(b[1]),.y(y[1]));
_xor2 U2_xor2(.a(a[2]),.b(b[2]),.y(y[2]));
_xor2 U3_xor2(.a(a[3]),.b(b[3]),.y(y[3]));//assign exclusive or
endmodule 

module _and2_4bits(a,b,y);//4bits and
input[3:0] a,b;//input
output[3:0] y;//output
assign y=a&b;//assign and
endmodule

module _or2_4bits(a,b,y);//4bits or
input[3:0] a,b;//input
output[3:0] y;//output
assign y=a|b;//assign or
endmodule

module _xnor2_4bits(a,b,y);//4bits xnor
input[3:0] a,b;//input
output[3:0] y;//output
wire[3:0] w0;
_xor2_4bits U0_xor2_4bits(.a(a),.b(b),.y(w0));
_inv_4bits U1_inv_4bits(.a(w0),.y(y));//assign 4bits xnor
endmodule


