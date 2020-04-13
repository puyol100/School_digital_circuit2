
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
input a,b,c;
output y;
assign y=a&b&c;
endmodule

module _or3(a,b,c,y);
input a,b,c;
output y;
assign y=a|b|c;
endmodule

module _and4(a,b,c,d,y);
input a,b,c,d;
output y;
assign y=a&b&c&d;
endmodule

module _or4(a,b,c,d,y);
input a,b,c,d;
output y;
assign y=a|b|c|d;
endmodule

module _and5(a,b,c,d,e,y);
input a,b,c,d,e;
output y;
assign y=a&b&c&d&e;
endmodule

module _or5(a,b,c,d,e,y);
input a,b,c,d,e;
output y;
assign y=a|b|c|d|e;
endmodule