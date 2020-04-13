module ha(a,b,s,co);//Setting module of half adder
input a,b; //Setting input value
output s,co;//Settin output value
_xor2 U0_xor2(.a(a), .b(b), .y(s));//Sum's value
_and2 U1_and2(.a(a), .b(b), .y(co));//Carry out value
endmodule//end half adder module