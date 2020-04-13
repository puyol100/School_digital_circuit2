module bus_addr(address,S0_sel,S1_sel);//bus for address decoding
	input [7:0]address;//input 8bit address
	output reg S0_sel,S1_sel;//select siganl
	wire 	[1:0] upper_2bit = address[6:5];//wire 
 	
	always @(upper_2bit)//change select value with address
	begin
		if(upper_2bit == 2'b00)
		{S0_sel, S1_sel} = 2'b10;
		else if(upper_2bit == 2'b01)
		{S0_sel, S1_sel} = 2'b01;
		else if(upper_2bit == 2'b10)
		{S0_sel, S1_sel} = 2'b00;
	end
	
endmodule 