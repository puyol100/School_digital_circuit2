module ram(clk, cen, wen, addr, din, dout);//Memory top module
	input clk;//clk for memory
	input cen, wen;//enable signal
	input [4:0] addr;//address
	input [31:0] din;//input value
	output reg [31:0] dout;//output value
	
	reg [31:0] mem [0:31];//size of memory 
	
	integer i;
	
	initial begin
		for(i=0; i<32; i=i+1) begin//loop for memory initialize
			mem[i] <= 32'h00000000; 
			end
	end//initialize memory
	
	always @ (posedge clk)//memory exec
	begin
		if(cen ==1'b1 && wen == 1'b1)begin mem[addr] <= din; dout <= 32'b0; end
		else if (wen == 1'b0 && cen == 1'b1) begin dout <= mem[addr]; end
		else if(cen == 1'b0) dout <= 32'b0;
	end
endmodule 