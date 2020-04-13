module rca_clk(clock, a, b, ci, s_rca, co_rca);//Settint rca_clk`
input  clock;
input [31:0] a,b;//32bit input
input ci;
output [31:0] s_rca;
output 		  co_rca;

reg  [31:0]   reg_a, reg_b;//register for 32bit
reg			  reg_ci;
reg  [31:0]   reg_s_rca;
reg 			  reg_co_rca;

wire  [31:0]   wire_s_rca;
wire   		  wire_co_rca;


always @ (posedge clock)//concept of clock
begin
	
	reg_a 	 <= a;
	reg_b 	 <= b;
	reg_ci  	 <= ci;
	reg_s_rca <= wire_s_rca;
	reg_co_rca <= wire_co_rca;
end//flip-flop

//module rca32(a,b,ci,s,co);
rca32 RC0(.a(reg_a),.b(reg_b),.ci(reg_ci),.s(wire_s_rca),.co(wire_co_rca));
assign s_rca = reg_s_rca; //for result assign s
assign co_rca = reg_co_rca; //for result assign carry out

endmodule