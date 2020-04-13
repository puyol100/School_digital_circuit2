module mx4(y, d0, d1, d2, d3, s);//module for mx4
	input d0, d1, d2, d3; 
	input [1:0]s;//select signal
	output y;
	wire [1:0]wmx4;//wire for last mx
	//instance 3 mx2 for mx4
mx2 A0_mx2(.d0(d0),.d1(d1),.s(s[0]),.y(wmx4[0]));	
mx2 A1_mx2(.d0(d2),.d1(d3),.s(s[0]),.y(wmx4[1]));
mx2 A2_mx2(.d0(wmx4[0]),.d1(wmx4[1]),.s(s[1]),.y(y));
endmodule 