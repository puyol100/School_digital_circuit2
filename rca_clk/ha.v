module ha(a,b,s,co);//Setting module of half adder
input a,b; //Setting input value
output s,co;//Settin output value
 assign s = a^b;
 assign co = a&b;
endmodule//end half adder module