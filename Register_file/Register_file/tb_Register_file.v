`timescale 1ns/100ps//setting timescale

module tb_Register_file;//tb for register_file
	reg clk, reset_n, we;//input
	reg [2:0]wAddr, rAddr;//input for Address
	reg [31:0]wData;//input for write data
	wire [31:0]rData;//read data
//module Register_file(clk, reset_n, wAddr, wData, we, rAddr, rData);
Register_file RG_Register_file(.clk(clk),.reset_n(reset_n),.wAddr(wAddr),.wData(wData),.we(we),.rAddr(rAddr),.rData(rData));	
//instance for testing register_file
	always 
	begin 
		#10; clk = ~clk;
	end //making clock pulse
	
	initial
	begin//test start
		clk=0; reset_n = 0; we =0; wAddr=3'b000; rAddr = 3'b000; wData = 32'h00000000;
	#15; reset_n = 1; we = 1;  wData = 32'h11111111;
	#20; wAddr = 3'b001; wData = 32'hff00ff00;
	#20; wAddr = 3'b010;
	#20; wAddr = 3'b011; wData = 32'h00ff00ff;
	#20; we = 0;
	#20; rAddr=3'b001;
	#20; rAddr=3'b010;
	#20; rAddr=3'b011;
	#25;
	$stop;
	end 
	

endmodule 