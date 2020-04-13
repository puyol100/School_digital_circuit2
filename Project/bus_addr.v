module bus_addr(address, S0_sel, S1_sel, S2_sel, S3_sel);//module for bus addr
   input [7:0] address;
   output reg S0_sel, S1_sel, S2_sel, S3_sel;
   always@(address)//case by address
   begin
      if(address[7:5]==3'b000)
         {S0_sel, S1_sel, S2_sel, S3_sel}=4'b1000;//choice matrix
      else if(address[7:5]==3'b001)
         {S0_sel, S1_sel, S2_sel, S3_sel}=4'b0100;//choice ram A
      else if(address[7:5]==3'b010)
         {S0_sel, S1_sel, S2_sel, S3_sel}=4'b0010;//choice ram B
      else if(address[7:5]==3'b011)
         {S0_sel, S1_sel, S2_sel, S3_sel}=4'b0001;//choice ram c
      else//default
         {S0_sel, S1_sel, S2_sel, S3_sel}=4'b0000;
   end
endmodule 