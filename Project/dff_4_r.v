// dff_4_r


module dff_4_r(clk, reset_n, d, q); // 4-bit register dff_4_r for control the exec_count

input clk, reset_n;
input [3:0] d;
output reg [3:0] q;

// this dff is 4bit capacity and under control of clk and reset_n

always @(posedge clk)
	begin
		if(reset_n ===1'b0)	q <= 4'b0000;
		else						q <= d;
	end
endmodule
