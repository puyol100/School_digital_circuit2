module cla_clk(clock, a, b, ci, s_cla, co_cla);//setting cla_clk
 input			clock;//for clock signal
 input   [31:0] a, b;//32 bit
 input 			ci;
 output   [31:0] s_cla;
 output 			co_cla;
 
 reg [31:0]   reg_a, reg_b;//register for 32bit
 reg				reg_ci;
 reg [31:0]   reg_s_cla;
 reg				reg_co_cla;
 
 wire [31:0]   wire_s_cla;
 wire 			wire_co_cla; // wire
 
 always @ (posedge clock)//concept of clock
 begin
	
		reg_a			<= a;  
 		reg_b			<= b;
		reg_ci		<= ci;
		reg_s_cla	<= wire_s_cla;
		reg_co_cla	<= wire_co_cla;//flip-flop
end
cla32 CL32(.a(reg_a),.b(reg_b),.ci(reg_ci),.s(wire_s_cla),.co(wire_co_cla));
	assign	 s_cla = reg_s_cla;
	assign    co_cla= reg_co_cla;// Draw out the reg_s and reg_co value


endmodule
 
 
 
 