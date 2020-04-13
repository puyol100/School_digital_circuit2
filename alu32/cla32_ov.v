module cla32_ov(a,b,ci,s,co_prev,co);//for cla 32bits overflow
	input [31:0] a,b;//input 
	input ci;
	output [31:0] s;
	output co_prev;
	output co;
	//co, co_prev for checking overflow
	
	wire c1,c2,c3,c4,c5,c6,c7;

cla4 CL0(.a(a[3:0])  ,.b(b[3:0])  ,.ci(ci), .s(s[3:0])  ,.co(c1));
cla4 CL1(.a(a[7:4])  ,.b(b[7:4])  ,.ci(c1), .s(s[7:4])  ,.co(c2));
cla4 CL2(.a(a[11:8]) ,.b(b[11:8]) ,.ci(c2), .s(s[11:8]) ,.co(c3));
cla4 CL3(.a(a[15:12]),.b(b[15:12]),.ci(c3), .s(s[15:12]),.co(c4));
cla4 CL4(.a(a[19:16]),.b(b[19:16]),.ci(c4), .s(s[19:16]),.co(c5));
cla4 CL5(.a(a[23:20]),.b(b[23:20]),.ci(c5), .s(s[23:20]),.co(c6));
cla4 CL6(.a(a[27:24]),.b(b[27:24]),.ci(c6), .s(s[27:24]),.co(c7));
cla4_ov CL7(.a(a[31:28]),.b(b[31:28]),.ci(c7),.s(s[31:28]),.c3(co_prev),.co(co));
//instances for cla32 overflow

endmodule
