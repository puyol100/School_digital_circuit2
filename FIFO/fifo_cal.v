module fifo_cal(state,data_count,head,tail,re,we,next_data_count,next_head,next_tail);//fifo calculating logic
	input [2:0] state, head, tail;//state head tail
	input [3:0] data_count;//data_count
	output re,we;//read enable signal and write enable signal
	output [3:0] next_data_count;//for next_data_count
	output [2:0] next_head;//for next_head
	output [2:0] next_tail;//for next_tail
	reg [2:0] next_tail,next_head;
	reg [3:0] next_data_count;
	reg re,we;
	parameter INIT    =3'b000;
   parameter NO_OP   =3'b001;
   parameter WRITE   =3'b010;
   parameter WR_ERROR=3'b011;
   parameter READ      =3'b100;
   parameter RD_ERROR=3'b101;
	//Binary encoded 
	always @ (state, data_count)
		begin
		if (state == INIT) //if state is Init 
			begin
				next_head <= 3'b000; next_data_count <= 4'b000; next_tail <= 3'b000; 
			end //all point and data_count are zero
		if(state == WRITE)	//if state is Write
			begin
				case(data_count)//case of data_count
				4'b0000:	next_data_count <= 4'b0001;//0 -> 1
				4'b0001:	next_data_count <= 4'b0010;//1 -> 2
				4'b0010:	next_data_count <= 4'b0011;//2 -> 3
				4'b0011:	next_data_count <= 4'b0100;//3 -> 4
				4'b0100:	next_data_count <= 4'b0101;//4 -> 5
				4'b0101:	next_data_count <= 4'b0110;//5 -> 6
				4'b0110:	next_data_count <= 4'b0111;//6 -> 7
				4'b0111:	next_data_count <= 4'b1000;//7 -> 8
				default:	next_data_count <= data_count;
				endcase//increase data count
				case(tail)//case of tail
				3'b000:	next_tail <= 3'b001;//0 -> 1
				3'b001:	next_tail <= 3'b010;//1 -> 2
				3'b010:	next_tail <= 3'b011;//2 -> 3
				3'b011:	next_tail <= 3'b100;//3 -> 4
				3'b100:	next_tail <= 3'b101;//4 -> 5
				3'b101:	next_tail <= 3'b110;//5 -> 6
				3'b110:	next_tail <= 3'b111;//6 -> 7
				3'b111:	next_tail <= 3'b000;//7 -> 0
				default:	next_tail <= tail;
				endcase//increa point tail
				next_head <= head;//because of Write state head point is not change
				we <= 1;//write enable 
			end
		else if(state == READ)//if state is Read
			begin
				case(data_count)
				4'b1000:	next_data_count <= 4'b0111;//8 -> 7
				4'b0111:	next_data_count <= 4'b0110;//7 -> 6
				4'b0110:	next_data_count <= 4'b0101;//6 -> 5
				4'b0101:	next_data_count <= 4'b0100;//5 -> 4
				4'b0100:	next_data_count <= 4'b0011;//4 -> 3
				4'b0011:	next_data_count <= 4'b0010;//3 -> 2
				4'b0010:	next_data_count <= 4'b0001;//2 -> 1
				4'b0001:	next_data_count <= 4'b0000;//1 -> 0
				default:	next_data_count <= data_count;
				endcase	//decrea data_count
				case(head)//case of head
				3'b000:	next_head <= 3'b001;//0 -> 1
				3'b111:	next_head <= 3'b000;//7 -> 8
				3'b110:	next_head <= 3'b111;//6 -> 7
				3'b101:	next_head <= 3'b110;//5 -> 6
				3'b100:	next_head <= 3'b101;//4 -> 5
				3'b011:	next_head <= 3'b100;//3 -> 4
				3'b010:	next_head <= 3'b011;//2 -> 3
				3'b001:	next_head <= 3'b010;//1 -> 2
				default:	next_head <= head;
				endcase//increase head point
			next_tail <= tail;//because of Read state tail point is not change
			re <= 1;//read enable
		end	
		else
			begin
				next_head <= head;
				next_tail <= tail;
				next_data_count <= data_count;
				re = 0;	we = 0;
				end
		end	//end of calculating
endmodule		