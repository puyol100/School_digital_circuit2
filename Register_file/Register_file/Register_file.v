module Register_file(clk, reset_n, wAddr, wData, we, rAddr, rData);//Register_file
	input clk, reset_n, we;//input 
	input [2:0]wAddr, rAddr;//read and write address
	input [31:0]wData;//write data
	output [31:0]rData;//read data
	
	wire [7:0]to_reg;//for write_operation
	wire [31:0]from_reg[7:0];//for read_operation
//module register32_8(clk,reset_n,en,d_in,d_out0,d_out1,d_out2,d_out3,d_out4,d_out5,d_out6,d_out7);
//module write_operation(Addr,we,to_reg);
//module read_operation(Addr,Data,from_reg0,from_reg2,from_reg3,from_reg4,from_reg5,from_reg6,from_reg7);
write_operation U0_write_operation(.Addr(wAddr),.we(we),.to_reg(to_reg));
register32_8 U1_register32_8(.clk(clk),.reset_n(reset_n),.en(to_reg),.d_in(wData),.d_out0(from_reg[0]),.d_out1(from_reg[1]),.d_out2(from_reg[2]),.d_out3(from_reg[3]),.d_out4(from_reg[4]),.d_out5(from_reg[5]),.d_out6(from_reg[6]),.d_out7(from_reg[7]));
read_operation U2_read_operation(.Addr(rAddr),.Data(rData),.from_reg0(from_reg[0]),.from_reg1(from_reg[1]),.from_reg2(from_reg[2]),.from_reg3(from_reg[3]),.from_reg4(from_reg[4]),.from_reg5(from_reg[5]),.from_reg6(from_reg[6]),.from_reg7(from_reg[7]));
//instances for Register_file
endmodule 

