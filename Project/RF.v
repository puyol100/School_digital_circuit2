module RF(clk, clear, wAddr, wData, we, rAddr, rData);//module of rigister file
   input                clk, clear, we;
   input    [3:0]      wAddr, rAddr;//input for Addr
   input    [31:0]   wData;//input 
   output    [31:0]   rData;//output for data
   wire      [7:0]    to_reg;//wire
   wire      [31:0]   from_reg[7:0]; //wire array
	   //module of read_operation
   read_operation      U2_read(.Addr(rAddr), .Data(rData), 
   .from_reg0(from_reg[0]), .from_reg1(from_reg[1]), .from_reg2(from_reg[2]), .from_reg3(from_reg[3]), .from_reg4(from_reg[4]),
   .from_reg5(from_reg[5]), .from_reg6(from_reg[6]), .from_reg7(from_reg[7]));   
   //write opreation
   write_operation   U1_write(.Addr(wAddr), .we(we),    .to_reg(to_reg));//module for write operation
   register32_8       U0_register (.clk(clk), .reset_n(~clear), .en(to_reg), .d_in(wData), 
   .d_out0(from_reg[0]), .d_out1(from_reg[1]), .d_out2(from_reg[2]), .d_out3(from_reg[3]), .d_out4(from_reg[4]), .d_out5(from_reg[5])
   ,.d_out6(from_reg[6]), .d_out7(from_reg[7]));//register 32_8   
endmodule 