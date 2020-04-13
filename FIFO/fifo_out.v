module fifo_out(state,data_count,empty,full,rd_ack,rd_err,wr_ack,wr_err);//fifo out state logic
	input [2:0]state;//state
	input [3:0]data_count;//data_count
	output empty,full,rd_ack,rd_err,wr_ack,wr_err;//for handshake signal
	reg empty,full,rd_ack,rd_err,wr_ack,wr_err;
	parameter INIT    =3'b000;
   parameter NO_OP   =3'b001;
   parameter WRITE   =3'b010;
   parameter WR_ERROR=3'b011;
   parameter READ      =3'b100;
   parameter RD_ERROR=3'b101;
	//Binary encoded 
	always @(state or data_count)
	begin 
	 if(data_count === 4'b0000) begin empty=1; full=0; end//make empty signal
    else if(data_count === 4'b1000) begin empty=0; full=1; end//make full signal
    else begin empty=0; full=0; end//data is full or empty or else?
   	case(state)
			WR_ERROR: begin//if State is WR_ERROR
			wr_ack <= 0;
         wr_err <= 1;//wr_err signal
         rd_ack <= 0;
         rd_err <= 0;
         end//make hanshake signal
			RD_ERROR:  begin//if State is RD_ERROR
         wr_ack <= 0;
         wr_err <= 0;
			rd_ack <= 0;
         rd_err <= 1;//rd_err signal
         end//make handshake signal
			INIT: begin//if State is INIT
         wr_ack <= 0;
         wr_err <= 0;
			rd_ack <= 0;
         rd_err <= 0;//all signal initialized
         end//make handshake signal
			WRITE:begin//if State is WRITE
			wr_ack <= 1;//wr_ack signal
         wr_err <= 0;
         rd_ack <= 0;
         rd_err <= 0;
         end//make handshake signal
			READ: begin////if State is Read
         wr_ack <= 0;
         wr_err <= 0;
         rd_ack <= 1;//rd_ack signal
         rd_err <= 0;
         end//make handshake signal
		endcase
	end	
endmodule 