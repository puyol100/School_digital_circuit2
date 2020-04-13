module LSL8(d_in, shamt, d_out);//module for lsl
	input [7:0] d_in;//8bits input
	input [1:0] shamt;//shift amount
	output [7:0] d_out;//8bits output
//mx4(y, d0, d1, d2, d3, s);
mx4	D7_mx4(.y(d_out[7]),.d0(d_in[7]),.d1(d_in[6]),.d2(d_in[5]),.d3(d_in[4]),.s(shamt));//D7
mx4	D6_mx4(.y(d_out[6]),.d0(d_in[6]),.d1(d_in[5]),.d2(d_in[4]),.d3(d_in[3]),.s(shamt));//D6
mx4	D5_mx4(.y(d_out[5]),.d0(d_in[5]),.d1(d_in[4]),.d2(d_in[3]),.d3(d_in[2]),.s(shamt));//D5
mx4	D4_mx4(.y(d_out[4]),.d0(d_in[4]),.d1(d_in[3]),.d2(d_in[2]),.d3(d_in[1]),.s(shamt));//D4
mx4	D3_mx4(.y(d_out[3]),.d0(d_in[3]),.d1(d_in[2]),.d2(d_in[1]),.d3(d_in[0]),.s(shamt));//D3
mx4	D2_mx4(.y(d_out[2]),.d0(d_in[2]),.d1(d_in[1]),.d2(d_in[0]),.d3(1'b0),.s(shamt));//D2
mx4	D1_mx4(.y(d_out[1]),.d0(d_in[1]),.d1(d_in[0]),.d2(1'b0),.d3(1'b0),.s(shamt));//D1
mx4	D0_mx4(.y(d_out[0]),.d0(d_in[0]),.d1(1'b0),.d2(1'b0),.d3(1'b0),.s(shamt));//D0
//instance 8 mx4 for LSL
	
	
	
endmodule 