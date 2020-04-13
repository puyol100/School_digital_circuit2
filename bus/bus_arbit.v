module bus_arbit(M0_req,M1_req,reset_n,clk,M1_grant,M0_grant);//module for arbitor
input M0_req,M1_req,reset_n,clk;//request inputs 
output reg M0_grant;
output reg M1_grant;//output for grant

parameter 	M0_Grant = 1'b0; 
parameter	M1_Grant = 1'b1;//state for arbit
reg state;
always @ (posedge clk)begin///ns logic
	if(reset_n ==0) state <= M0_Grant;//reset
	else begin
	case(state)//next state decided by current state and request
		M0_Grant:begin//current state is M0_grant
			if(M0_req == 0 && M1_req == 1) state <= M1_Grant;
			else if((M0_req == 0 && M1_req == 0) ||(M0_req == 1)) state <= M0_Grant;
			else state <= M0_Grant;
			end
		M1_Grant:begin//current state is M1_grant
			if(M1_req == 1) state <= M1_Grant;
			else state <= M0_Grant;
			end
		endcase
		end
end

always @ (*)begin//chage the grant case by state
	case(state)
	M0_Grant	:begin M0_grant <= 1'b1; M1_grant <= 1'b0; end  //M0 ==0 , M1 == 0
	M1_Grant	:begin M0_grant <= 1'b0; M1_grant <= 1'b1; end //M1 ==1, M0==0
   default :begin M1_grant <=1'bx;	
						M0_grant <=1'bx;
				end
	endcase
end
endmodule 