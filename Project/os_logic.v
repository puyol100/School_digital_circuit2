module os_logic(clk, state, result_in, result_out, fifo_re, fifo_we, multi_opdone, fifo_data_count0, fifo_data_count1);//os logic
input clk;
input [1:0] state;
input [63:0] result_in;
input [3:0] fifo_data_count0, fifo_data_count1;//input for os logic
output reg [31:0] result_out;
output reg fifo_re,fifo_we;
output reg multi_opdone;//output for os logic
parameter IDLE = 2'b00;
parameter EXEC = 2'b01;
parameter DONE   = 2'b10;//setting parameter
initial
begin multi_opdone<=1'b0; end // initialize
always @(posedge clk) //react by posedge clk
begin
   if(state === DONE)  // if DONE state		
	begin 
		if(fifo_data_count0 == 4'b1000)//fifo data_count full befor empty
		begin
			fifo_re = 1'b1;
			fifo_we = 1'b0; 
			result_out = result_in[31:0]; 
			multi_opdone = 1'b0; end
		else if(fifo_data_count0 == 4'b0000)//fifo_datacount empty after full
		begin
			fifo_re = 1'b1;
			fifo_we = 1'b1; 
			result_out = result_in[31:0];
			multi_opdone = 1'b1;end
		else
		begin
			fifo_re = 1'b1;
			fifo_we = 1'b1; 
			result_out = result_in[31:0];
			multi_opdone = 1'b0;end
	end
   else    begin   fifo_re = 1'b0; fifo_we = 1'b0; result_out = result_in[31:0]; end
end

endmodule
