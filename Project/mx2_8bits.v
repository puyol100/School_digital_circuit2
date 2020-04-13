module mx2_8bits(d0, d1, s, y);//mx2 for 8bit
input [7:0] d0, d1;//8bit input
input s;//select signal
output [7:0] y;//8bit output

assign y = (s==0)?d1:d0;//mux

endmodule
