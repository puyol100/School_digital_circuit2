module print_RCA_result_to_7segment(a,b,cin,dec_out);
	input [3:0] a;
	input [3:0] b;//two input value a,b
	input 		cin;//carry in value
	output [13:0] dec_out;//output for 7segment 
	
	wire [3:0] s;//wire link rca'sum value with segment  
	wire 		  c;//wire for carry
	
	rca U0_rca(.a(a),.b(b),.ci(cin),.s(s),.co(c));//input to rca
	seg_dec U1_seg_dec(.iHex(s),.oSEG7(dec_out[6:0]));//7segment output
	seg_dec U2_seg_dec(.iHex({3'b000,c}),.oSEG7(dec_out[13:7]));//7segment output
	
	endmodule