module write_operation(Addr,we,to_reg);//write_operation
	input we;//write enable signal
	input [2:0]Addr;//write address
	output [7:0]to_reg;//write register
	
	wire [7:0] write_write;
	//_3_to_8_decoder(d,q)
_3_to_8_decoder A0_3_to_8_decoder(.d(Addr),.q(write_write));
	//module _and2(a,b,y)
_and2 D0(.a(we),.b(write_write[0]),.y(to_reg[0]));
_and2 D1(.a(we),.b(write_write[1]),.y(to_reg[1]));
_and2 D2(.a(we),.b(write_write[2]),.y(to_reg[2]));
_and2 D3(.a(we),.b(write_write[3]),.y(to_reg[3]));
_and2 D4(.a(we),.b(write_write[4]),.y(to_reg[4]));
_and2 D5(.a(we),.b(write_write[5]),.y(to_reg[5]));
_and2 D6(.a(we),.b(write_write[6]),.y(to_reg[6]));
_and2 D7(.a(we),.b(write_write[7]),.y(to_reg[7]));
//and gate for write register 
	
endmodule 
	
	
	