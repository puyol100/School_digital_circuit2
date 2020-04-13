module Multiplier_Slave(M_din, S_address, S_din, S_sel, S_wr, adder_opdone, clk, reset_n, result, S_dout, adder_opstart,m_interrupt, multi_opclear, multi_opstart, multiplicand, multiplicand_we, multiplier, multiplier_we, rAddr);
   input               S_sel, S_wr, adder_opdone, clk, reset_n;
   input[4:0]         S_address;
   input[31:0]         M_din, S_din, result;//input 
   output reg         adder_opstart, multi_opclear, multi_opstart, multiplicand_we, multiplier_we;//output signal
   output reg [3:0]   rAddr;//address for read 
   output reg[31:0]   S_dout, multiplicand, multiplier;
	output m_interrupt;//m_interrupt signal
   reg[31:0]   A_Matrix, B_Matrix,INTERRUPT_ENABLE,MULTI_START, ADD_START,OPERATION_CLEAR,READ_ADDRESS,count;//inner register
 assign m_interrupt=INTERRUPT_ENABLE[0]&adder_opdone;//make m_interrupt signal
 always @ (posedge clk or negedge reset_n) begin//reacted by posedge clk, negedge reset_n
      if (~reset_n) begin//case reset
         A_Matrix <= 0;
         B_Matrix <= 0;
         INTERRUPT_ENABLE <= 0;
         MULTI_START <= 0;
         ADD_START <= 0;
         OPERATION_CLEAR <= 0;
         READ_ADDRESS <=0;
         adder_opstart <= 0;
         multi_opclear <= 0;
         multi_opstart <= 0;
         multiplicand_we <= 0;
         multiplier_we <= 0;
         rAddr <= 0;
         S_dout <= 0;
         multiplicand <= 0;
         multiplier <= 0;
         count <= 1;end//all of value resetting
      else begin
				case ({S_wr, S_sel})//select by S_wr, S_sel
            2'b00   :   begin//if S_wr=0, S_sel=0
               if (~MULTI_START) begin
                  if (count<256) begin
                     A_Matrix <= M_din;//store to register
                     multiplicand_we <= 1'b0;
                     multiplier_we <= 1'b0;end   
                  else begin 
                     B_Matrix <= M_din;//store to register
                     multiplicand_we <= 1'b0;
                     multiplier_we <= 1'b0;end
                  count = count<<1;///////////S_sel = 0; S_wr = 1; 
               end
            end
            2'b11   :  begin
               case(S_address[2:0])//cased by S_address lower bit
                  3'b000 : begin 
                     multiplicand <= M_din;//go to fifo
                     multiplicand_we<=1'b1;//write enalbe == 1'b1
                     multiplier_we<=1'b0;end
                  3'b001 : begin
                     multiplier <= M_din;//go to fifo
                     multiplicand_we<=1'b0;//write enalbe == 1'b1
                     multiplier_we<=1'b1;
                  end
                  3'b010 : begin INTERRUPT_ENABLE[0]=S_din[0];end//INTERRUPT_ENABLE[0] store S_din[0] bit
                  3'b011 : begin
                     MULTI_START[0]=S_din[0];//decide Multi_start
                     if(MULTI_START[0])
                     begin
                        multi_opstart=1'b1;//yes
                        adder_opstart<=1'b0;
                        multi_opclear<=1'b0;
                        multiplicand_we<=1'b0;
                        multiplier_we<=1'b0;end
                     else
                     begin
                        multi_opstart=1'b0;//no
                        adder_opstart<=1'b0;
                        multi_opclear<=1'b0;
                        multiplicand_we<=1'b0;
                        multiplier_we<=1'b0;end
                  end
                  3'b100 : begin
                     ADD_START[0]=S_din[0];//case for ADD operation
                     if(ADD_START[0])
                     begin adder_opstart=1;end
                     else//ADD NOT START
                     begin adder_opstart=0;end
                  end
                  3'b101 : begin//case for opeRATION_CLEAR
                     OPERATION_CLEAR[0]=S_din[0];
                     if(OPERATION_CLEAR[0])
                     begin multi_opclear=1;end
                     else//NOT CLEAR
                     begin multi_opclear=0; end
                  end
                  default : begin
							
                  end
               endcase
            end
            
            default   :  
                  begin
						
            end
         endcase
         end
      end
endmodule 