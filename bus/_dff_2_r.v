module _dff_2_r(clk,reset_n,d,q);//dff_reset for 2bit
	input clk, reset_n;
	input [1:0] d;//2bit input
	output reg [1:0]q;//2bit output
	always @(posedge clk or negedge reset_n)//edge trigger and active low reset_n
	begin	
		if (reset_n == 1'b0) q <= 2'b00;
		else q <= d;
	end //dff
endmodule 