module fa(a,b, ci, s, co); //Setting full adder module  
input a, b, ci;//3 input
output s, co;//2 output
wire c1,c2,sm;//Wire 
ha U0_ha(.a(a), .b(b), .s(sm), .co(c1));
ha U1_ha(.a(sm), .b(ci), .s(s), .co(c2));
_or2 U2_or(.a(c1),.b(c2), .y(co));//Or instance for carry out
endmodule   
