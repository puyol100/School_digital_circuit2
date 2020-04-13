module mx2_32bits(d0, d1, s, y);//mx2 for 32bit
input [31:0] d0, d1;//32bit input
input s;//select signal
output [31:0] y;//32bit output
assign y = (s==0)?d1:d0;//mux
endmodule

