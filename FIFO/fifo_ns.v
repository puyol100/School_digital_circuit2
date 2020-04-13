module fifo_ns(rd_en, wr_en, state, data_count, next_state);//fifo next_state logic
   input rd_en, wr_en;//read write enable input
   input [2:0] state;//state
   input [3:0] data_count;//data_count
   output[2:0]   next_state;//for next_state
   reg   [2:0] next_state;
	parameter INIT      =3'b000;
   parameter NO_OP   =3'b001;
   parameter WRITE   =3'b010;
   parameter WR_ERROR=3'b011;
   parameter READ      =3'b100;
   parameter RD_ERROR=3'b101;
   	//Binary encoded 
	always@(state, data_count, rd_en, wr_en)
   begin
      if(rd_en == 0 && wr_en ==0)begin next_state<=NO_OP; end//There is no operation
      case(state)//if operation exist
			INIT   ://if state is Init
         if(rd_en == 1'b1 && data_count == 4'b0000) next_state<=RD_ERROR;//there is no data to read
         else if(wr_en == 1'b1) next_state<=WRITE;// there is write enable signal 
			NO_OP   : //if state is NO_OP
         if(data_count != 4'b1000 && wr_en == 1'b1) next_state<=WRITE;//if data is not full and wr_en is active
         else if(data_count == 4'b1000 && wr_en == 1'b1) next_state<=WR_ERROR;//if data is full and wr_en is active
         else if(data_count != 4'b0000 && rd_en == 1'b1) next_state<=READ;//if data is not empty and rd_en is active
         else if(data_count == 4'b0000 && rd_en == 1'b1) next_state<=RD_ERROR;//if data is empty and rd_en is active
         WRITE   : //if state is Write
         if(data_count == 4'b1000 && wr_en == 1'b1) next_state<=WR_ERROR;//if data is full and wr_en is active  
         else if(data_count != 4'b1000 && wr_en == 1'b1) next_state<=WRITE;//if data is not full and wr_en is active
         else if(data_count != 4'b0000 && rd_en == 1'b1) next_state<=READ;//if data is not empty and rd_en is active
			WR_ERROR   : //if state is WR_ERROR
         if(data_count != 4'b0000 && rd_en == 1'b1) next_state<=READ;//if data is not empty and rd_en is active
         else if(wr_en == 1'b1) next_state<=WR_ERROR;
         READ   : //if state is READ
         if(data_count != 4'b0000 && rd_en == 1'b1) next_state<=READ;//if data is not empty and rd_en is active
         else if(data_count == 4'b0000 && rd_en == 1'b1) next_state<=RD_ERROR;//if data is empty and rd_en is active
         else if(data_count != 4'b1000 && wr_en == 1'b1) next_state<=WRITE;//if data is not empty and wr_en is active
         RD_ERROR   :// if state is RD_ERROR
         if(data_count == 4'b0000 && rd_en == 1'b1) next_state<=RD_ERROR;//if data is empty and rd_en is active
         else if(wr_en == 1'b1) next_state<=WRITE;//if wr_en is active
      endcase
   end
endmodule

         