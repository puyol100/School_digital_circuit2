module _dff_r(clk, reset_n, d, q); // module for dff_r
		input clk, reset_n, d;
		output q;
		reg q;
		
always@(posedge clk or negedge reset_n)//pulse 
begin
	if(reset_n == 0) q <= 0;//active low
	else q <= d;
end

endmodule 	