module cal_flags4(op,result,co_add,c3_add,co_sub,c3_sub,c,n,z,v);//module for flags
input [2:0] op;//for opcode
input [3:0] result;
input co_add,c3_add,co_sub,c3_sub;//for carry and overflow flags
output c,n,z,v;//flags

assign c=(op[2:1]!=2'b11)? 1'b0:((op[0]==1'b0)?co_add:co_sub);//for carry flag

assign n=result[3];//for negative flag

assign z=(result==4'b0) ? 1 : 0;//for equal flag

assign v=(op[2:1] != 2'b11)? 1'b0:((op[0]==1'b0)?(co_add^c3_add):(co_sub^c3_sub));
//for overflow flag

endmodule
