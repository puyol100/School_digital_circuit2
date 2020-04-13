module mx2_32bits(d0, d1, s, y);//2inputs mux
	input 	[31:0]	d0, d1;//32bits input
	input					s;//input
	output	[31:0]	y;//output
	
	assign y = (s==0) ? d0 : d1;//define for mx2
	
endmodule
