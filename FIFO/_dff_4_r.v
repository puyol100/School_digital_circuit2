module _dff_4_r(clk,reset_n,d,q);//dff_reset for 4bit
	input clk, reset_n;
	input [3:0] d;//4bit input
	output [3:0]q;//4bit output
	reg [3:0]q;
	always @(posedge clk or negedge reset_n)//edge trigger and active low reset_n
	begin	
		if (reset_n == 1'b0) q <= 4'b0000;
		else q <= d;
	end //dff
endmodule 