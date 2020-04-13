module bus_arbit(clk, reset_n, M0_req, M1_req, M0_grant, M1_grant);//bus arbital
   input clk, reset_n;
   input M0_req, M1_req;//request signal
   output reg M0_grant, M1_grant;//Master gran siganal
   always@(posedge clk)//react by clk
   begin
      if(~reset_n)
      begin M0_grant=1; M1_grant=0;//M0 granted
		end
      else begin
			if(M0_req == 1'b1)begin M0_grant=1; M1_grant=0;end//M0 granted
			else
			begin
				if(M1_req == 1'b1)//M0_req== 1'b0 && M1_req ==1'b1
				begin M0_grant=0; M1_grant=1;end //Master M1
				else begin M0_grant=1; M1_grant=0;end//Master M0
			end
		end
   end
endmodule

   