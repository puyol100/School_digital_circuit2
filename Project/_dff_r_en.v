module _dff_r_en(clk, reset_n, en, d, q); // d flip-flop reset and enalbe
	input clk, reset_n, en, d;
	output reg q;
	
	always@(posedge clk or negedge reset_n) begin
		if(~reset_n)	q<=1'b0;
		else if(en) 	q<=d;
		else				q<=q;
	end
	
endmodule 