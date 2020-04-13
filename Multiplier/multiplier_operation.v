module multiplier_operation(clk,state,multiplicand,multiplier,op_done,U,V);//module for multiplication
	input clk;//input clk
	input [1:0]state;//input state
	input [31:0] multiplicand,multiplier;// multiplier, multiplicand
	output reg [31:0] U,V;//U, V for calculate
	output reg op_done;//op_done signal
	reg [3:0]data_count;//data counter
	reg [31:0]X;
	reg X_1;
	reg [31:0]Y;
	parameter IDLE = 2'b00;
	parameter EXEC = 2'b01;
	parameter DONE = 2'b10;//Binary encoding
always @ (posedge clk)begin //when clk posedge
		case (state)//case for state
		IDLE ://IDLE State
		begin
			op_done <= 1'b0;
			U <= 32'h0000_0000;
			V <= 32'h0000_0000;
			X <= multiplier; 
			Y <= multiplicand;
			X_1 <= 1'b0; 
		   data_count <= 4'h0;
		end// all the values are reset 
		EXEC :begin //EXEC state
		if(op_done)begin U <= U; V <= V; end//op_done signal is 1 U and V not change in EXEC state
 		else begin//op_done != 1'b1
			case ({X[1], X[0],X_1}) //radix 4
				3'b010 : begin//+Y
					U = U + Y; 
					end
				3'b100 :begin//check
					U = U + ~(Y*2) + 1'b1; // U - 2Y
				end
				3'b110 :begin
					U = U +(~Y) + 1'b1; // U - Y
					end
				3'b001 :begin//+Y
					U = U + Y;end
				3'b011 :begin// 2Y
					U = U + (Y*2);end//2Y
				3'b101 :begin
					U = U +(~Y) + 1'b1; // U - Y
					end
			endcase
					V = (V >> 2);
					V[31] <= U[1];
					V[30] <= U[0];
					if(U[31] == 1'b1)begin
					U = (U >> 2);
					U[31] <= 1'b1;
					U[30] <= U[29];
					end
					else  begin
					U = (U >> 2);
					U[31] <= U[30];
					U[30] <= U[29];
					end
			//same action in all cases
				X_1 <= X[1];
				X = (X >> 2);				
			data_count = data_count + 1'b1; 
			if(data_count == 4'b0000)begin //count is over
				op_done	 = 1'b1;  
			end
			end//because of radix 4 shifting 2 bits 
		end
		DONE : //action in DONE state
		begin
			op_done <= 1'b0;
			U <= 32'h0000_0000;
			V <= 32'h0000_0000;
			X <= multiplier; 
			Y <= multiplicand;
			X_1 <= 1'b0; 
		   data_count <= 4'h0;
			
		end
		default : //exception part
		begin
			op_done <= 1'bx;
			U <= 32'dx;
			V <= 32'dx;
			Y <= 32'dx;
			X <= 32'dx; 
			X_1 <= 1'bx;
			data_count <= 4'dx; 
		end
		endcase
	end
endmodule 
	