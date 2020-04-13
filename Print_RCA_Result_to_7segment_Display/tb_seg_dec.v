'timescale 1ns/100ps

module tb_seg_dec;
reg [3:0]tb_iHex;
wire[6:0]tb_oSEG7;

seg_dec U0_seg_dec(.iHex(tb_iHex),.oSEG7(tb_oSEG7));//link  to seg_dec 
initial

begin//exhausted 
	tb_iHex=4'h0;
	#10; tb_iHex=4'h1;
	#10; tb_iHex=4'h2;
	#10; tb_iHex=4'h3;
	#10; tb_iHex=4'h4;
	#10; tb_iHex=4'h5;
	#10; tb_iHex=4'h6;
	#10; tb_iHex=4'h7;
	#10; tb_iHex=4'h8;
	#10; tb_iHex=4'h9;
	#10; tb_iHex=4'ha;
	#10; tb_iHex=4'hb;
	#10; tb_iHex=4'hc;
	#10; tb_iHex=4'hd;
	#10; tb_iHex=4'he;
	#10; tb_iHex=4'hf;
	#10; $stop;
	end
	endmodule