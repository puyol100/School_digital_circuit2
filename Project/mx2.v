module mx2(d0, d1, s, y);//mx_2
input d0, d1;//input 
input s;
output y;//output 
wire sb, w0, w1;//wire for linking modules
_inv U0_inv (.a(s), .y(sb));
_nand2 U1_nand2 (.a(d0), .b(s), .y(w0));
_nand2 U2_nand2 (.a(d1), .b(sb), .y(w1));
_nand2 U3_nand2 (.a(w0), .b(w1), .y(y));
endmodule
