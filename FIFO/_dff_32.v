module _dff_32(clk,d,q);//dff for 32bit
	input clk;
	input [31:0] d;//32 bit input
	output [31:0]q;//32 bit output
	reg [31:0]q;
	always @(posedge clk)
	begin	
		q <= d;
	end //dff
endmodule 