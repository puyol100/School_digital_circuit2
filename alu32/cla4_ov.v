
module cla4_ov(a,b,ci,s,c3,co);
input [3:0] a, b;
input ci;
output [3:0] s;
output c3,co;
wire c1,c2;
clb4 CB0(.a(a),.b(b),.ci(ci),.c1(c1),.c2(c2),.c3(c3),.co(co));
// operate Carry look ahead-adder block
 
 fa_v2 f0(.a(a[0]),.b(b[0]),.ci(ci),.s(s[0]));
 fa_v2 f1(.a(a[1]),.b(b[1]),.ci(c1),.s(s[1]));
 fa_v2 f2(.a(a[2]),.b(b[2]),.ci(c2),.s(s[2]));
 fa_v2 f3(.a(a[3]),.b(b[3]),.ci(c3),.s(s[3]));
//4bit


endmodule 
