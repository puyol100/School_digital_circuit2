module MATRIX_Master(S_address, S_sel, S_wr, clear, clk, m_interrupt, rData, reset_n, M1_address, M1_dout, M1_req, M1_wr);
   input [4:0] S_address;//address for input lower bit
   input S_sel, S_wr, clear, clk, m_interrupt, reset_n;//select,wr,clear,interrupt signal
   input [31:0] rData;
   //S_sel, S_wr,S_din(S_address)
   output reg[7:0] M1_address;//output for M1_address
   output reg [31:0] M1_dout;//out value
   output reg M1_req, M1_wr;
   reg [7:0]ADR;//inner register for setting initial address ram 3 
   always @ (posedge clk)//reacted by clk
   begin
   if(~reset_n)
      begin
			ADR <= 96;
         M1_address<=8'b0;
         M1_req<=1'b0;
         M1_wr<=1'b0;
         M1_dout<=32'b0;end//case reset
   else if(clear)//case clear
      begin
			ADR<= 96;//96 is initial address of ram3
         M1_address<=8'b0;
         M1_req<=1'b0;
         M1_wr<=1'b0;
         M1_dout<=32'b0;end
   else begin
	if(m_interrupt == 1'b1)begin//case m_interrupt == 1'b1==> multiplier  finish
      M1_req <= 1'b1;
      M1_wr <= 1'b1;
      M1_dout <= rData;
		M1_address <= ADR;
		ADR = ADR + 1; end
	else if(m_interrupt == 1'b0) begin//case m_interrput ==1'b0 ==> multiplier is not finish
	   M1_req <= 1'b0;
      M1_wr <= 1'b0;
      M1_dout <= 32'b0;
		M1_address <= 8'b0;end
	end
end   
endmodule    
