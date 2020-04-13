module _dff_3_r(clk,reset_n,d,q);//dff_reset for 3bit
	input clk, reset_n;
	input [2:0] d;//3bit input
	output [2:0]q;//3bit output
	reg [2:0]q;
	always @(posedge clk or negedge reset_n)//edge trigger and active low reset_n
	begin	
		if (reset_n == 1'b0) q <= 3'b000;
		else q <= d;
	end //dff
endmodule 