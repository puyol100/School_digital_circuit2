module rca(a,b,ci,s,co);//RCA module for 4bits
input [3:0] a,b;//input
input ci;//first carry value
output [3:0] s;//Each Full adder output value 
output co;//last Full adder's carry out

wire [2:0] c;//wire for each carry out
fa U0_fa(.a(a[0]), .b(b[0]), .ci(ci),.s(s[0]), .co(c[0]));//first full adder
fa U1_fa(.a(a[1]), .b(b[1]), .ci(c[0]),.s(s[1]), .co(c[1]));//second full adder
fa U2_fa(.a(a[2]), .b(b[2]), .ci(c[1]),.s(s[2]), .co(c[2]));//Third full adder
fa U3_fa(.a(a[3]), .b(b[3]), .ci(c[2]),.s(s[3]), .co(co));//last full adder

endmodule