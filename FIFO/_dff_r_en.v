module _dff_r_en(clk,reset_n,en,d,q);//_dff_r_en for register
	input clk, reset_n, en, d;//input 
	output reg q;//output
	
	always@(posedge clk or negedge reset_n) begin//_dff_r_en function
		if(~reset_n)	q <= 1'b0;//active low
		else if(en) 	q <= d;
		else				q <= q;
		
	end
endmodule 