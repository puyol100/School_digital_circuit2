module fa(a,b, ci, s, co); //Setting full adder module  
input a, b, ci;//3 input
output s, co;//2 output
wire [2:0]w;//Wire 
ha U0_ha(.a(b), .b(ci), .s(w[0]), .co(w[1]));
ha U1_ha(.a(a), .b(w[0]), .s(s), .co(w[2]));
_or2 U2_or(.a(w[1]),.b(w[2]), .y(co));//Or instance for carry out
endmodule   
