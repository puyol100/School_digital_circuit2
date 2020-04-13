`timescale 1ns/100ps//setting timescale
module tb_fifo;//tb_fifo
	reg tb_clk, tb_reset_n, tb_rd_en, tb_wr_en;//inputs
	reg [31:0] 	tb_din;//32 bit input data
	wire [31:0] tb_dout;	//32 bit output data
	wire  tb_full, tb_empty, tb_wr_ack,tb_wr_err, tb_rd_ack, tb_rd_err;
	//for handshake signal
	wire 	[3:0] tb_data_count;	//data count wire
fifo	U0_fifO(.clk(tb_clk), .reset_n(tb_reset_n), .rd_en(tb_rd_en), .wr_en(tb_wr_en), .din(tb_din), .dout(tb_dout), .data_count(tb_data_count), .full(tb_full), .empty(tb_empty), .wr_ack(tb_wr_ack), .wr_err(tb_wr_err), .rd_ack(tb_rd_ack), .rd_err(tb_rd_err));
//instance fifo
always
begin
	#5;	tb_clk = 0;	#5;	tb_clk=1;//clock pulse 
end
//tb start
initial
begin
	tb_reset_n = 0;	tb_rd_en = 0;	tb_wr_en = 0;	tb_din = 32'h00000000;//setting first value
	#11	tb_reset_n = 1;
	#10	tb_rd_en = 1;
	#10	tb_rd_en = 0;	tb_wr_en = 1;	tb_din = 32'h00000001;	//input 8'h00000001
	#10	tb_din = 32'h00000002;	//input 8'h00000002
	#10	tb_din = 32'h00000003;	//input 8'h00000003
	#10	tb_din = 32'h00000004;	//input 8'h00000004
	#10	tb_din = 32'h00000005;	//input 8'h00000005
	#10	tb_din = 32'h00000006;	//input 8'h00000006
	#10	tb_din = 32'h00000007;	//input 8'h00000007
	#10	tb_din = 32'h00000008;	//input 8'h00000008
	#10	tb_din = 32'h00000009;	//input 8'h00000009
	#10	tb_din = 32'h0000000a;	//input 8'h0000000a
	#10	tb_din = 32'h0000000b;	//input 8'h0000000b but not save because data_count full
	#30	tb_wr_en = 0;//stop write
	#30	tb_rd_en = 1;//read
	#80	$stop;
end
endmodule			//end of module