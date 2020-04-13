module cal_flags32(op,result,co_add,co_prev_add,co_sub,co_prev_sub,c,n,z,v);//module for flags
 input [2:0]  op;//opcode
 input [31:0] result;
 input 		  co_add, co_prev_add, co_sub, co_prev_sub;//for checking carry and overflow value
 output 		  c,n,z,v;
 
 assign c=(op[2:1]!=2'b11)? 1'b0:((op[0]==1'b0)?co_add:co_sub);//for carry flag
 
 assign n=result[31];
 //for negative flag
 assign z=(result==32'h0) ? 1 : 0;
 //for equal flag
 assign v=(op[2:1] != 2'b11)? 1'b0:((op[0]==1'b0)?(co_add^co_prev_add):(co_sub^co_prev_sub));
 //for overflow flag
 
 endmodule