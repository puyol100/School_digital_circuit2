// dff_32_r


module dff_32_r(clk, reset_n, d, q); // 2-bit register dff_2_r for control state

input clk, reset_n;
input [31:0] d;
output reg [31:0] q;

// this dff is 2bit capacity and under control of clk and reset_n

always @(posedge clk)
	begin
		if(reset_n ===1'b0)	q <= 32'h0000_0000;
		else						q <= d;
	end
endmodule
