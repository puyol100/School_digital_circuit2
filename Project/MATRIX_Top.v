module MATRIX_Top(clk, reset_n, S_sel, S_wr, S_address, S_din, S_dout,m_interrupt, M1_wr, M1_req, M1_address, M1_dout, M_din, multi_done);
	input clk, reset_n;//input 
   input S_sel, S_wr;//Select and write signal
   input [7:0] S_address;//address 
   input [31:0] S_din, M_din;//S input M input 
	output [31:0] S_dout,M1_dout;
   output multi_done, m_interrupt,M1_req, M1_wr;//interrupt and multi_done signal,M1 signal
   output [7:0] M1_address;//M1 address
	wire [31:0] a0,a1,b0,b1,hdhd,AI,d_f_out,din_result;
	wire [3:0] c0,c1,d0,adad,wAddr;
	wire opclear,airforce,toRF,r,w0,w1,m,h,eg,BYE;
   fifo U0_multiplier(.clk(clk),.reset_n(reset_n),.rd_en(r),.wr_en(w0),.din(a0),.dout(b0),.data_count(c0),.opclear(opclear));//fifo for multiplier
	fifo  U1_multiplicand(.clk(clk), .reset_n(reset_n), .rd_en(r), .wr_en(w1), .din(a1), .dout(b1), .data_count(c1), .opclear(opclear));//fifo for multiplicand
   fifo  U2_ADDER_FIFO(.clk(clk), .din(din_result), .opclear(opclear), .rd_en(eg), .reset_n(reset_n), .wr_en(h), .data_count(d0), .dout(d_f_out));//fifo for adder
   ADDER  U3_ADDER(.add(d_f_out), .adder_opstart(airforce), .clk(clk), .fifo_data_count0(d0), .multi_opclear(opclear), .reset_n(reset_n), .RF_we(toRF), .adder_opdone(BYE), .din_result(AI), .fifo_re(eg), .wAddr(wAddr));
   RF    U4_ADDER_RF_Result(.clear(opclear), .clk(clk), .rAddr(adad), .wAddr(wAddr), .wData(AI), .we(toRF), .rData(hdhd));//fifo for result
   	Multiplier U5_Main(.clk(clk), .fifo_data_count0(c0),
   .fifo_data_count1(c1), .multi_opclear(opclear), .multi_opstart(m), .multiplicand(b1), .multiplier(b0), .reset_n(reset_n), 
   .din_result(din_result), .fifo_re(r), .fifo_we(h), .multi_opdone(multi_done));//module for multiplier
	
	  Multiplier_Slave  U6_Slave(.M_din(M_din), .S_address(S_address), .S_din(S_din), .S_sel(S_sel), .S_wr(S_wr), .adder_opdone(BYE), 
   .clk(clk), .reset_n(reset_n), .result(hdhd), .S_dout(S_dout), .adder_opstart(airforce), .m_interrupt(m_interrupt), 
   .multi_opclear(opclear), .multi_opstart(m), .multiplicand(a1), .multiplicand_we(w1), .multiplier(a0), .multiplier_we(w0), .rAddr(adad));
	
	MATRIX_Master U7_MATRIX_Master(.S_address(S_address), .S_sel(S_sel), .S_wr(S_wr), .clear(opclear), .clk(clk), .m_interrupt(m_interrupt), .rData(S_dout), .reset_n(reset_n), .M1_address(M1_address), .M1_dout(M1_dout), .M1_req(M1_req), .M1_wr(M1_wr));
   //module for Matrix_master
endmodule 