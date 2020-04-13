module read_operation(Addr,Data,from_reg0,from_reg1,from_reg2,from_reg3,from_reg4,from_reg5,from_reg6,from_reg7);
input [31:0]from_reg0,from_reg1,from_reg2,from_reg3,from_reg4,from_reg5,from_reg6,from_reg7;//for reading eight 32bits register
input [2:0]Addr;//read address
output [31:0]Data;//read data

wire [31:0]data_wire;
wire [31:0]ff_wire;
//module _8_to_1_MUX(a,b,c,d,e,f,g,h,sel,d_out);
_8_to_1_MUX U0_8_to_1_MUX(.a(from_reg0),.b(from_reg1),.c(from_reg2),.d(from_reg3),.e(from_reg4),.f(from_reg5),.g(from_reg6),.h(from_reg7),.sel(Addr),.d_out(Data));
//instance MUX for read_operation
endmodule  