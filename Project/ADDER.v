module ADDER(add, adder_opstart, clk, fifo_data_count0, multi_opclear, reset_n, RF_we, adder_opdone, din_result, fifo_re, wAddr);
// module of Adder
input [31:0] add;//input add value
input adder_opstart, clk, multi_opclear, reset_n;//input base signal
input [3:0] fifo_data_count0;//input for data_count
output reg RF_we, adder_opdone, fifo_re;
output reg [31:0] din_result;//Add result
output reg [3:0] wAddr;//Address for write
reg [31:0] a, b;//reg for input store
wire [31:0] u;//temp
wire [3:0] waddr;//wire for write address
cla32   U0_cla32(.a(a),.b(b),.ci(1'b0),.s(u),.co());
cla4   U1_cla4(.a(wAddr),.b(4'b1),.ci(1'b0),.s(waddr),.co());//Add +1 for increasing address
always @(posedge clk) begin
   if(~reset_n)begin// reset_n == 0
      RF_we=1'b0;
      adder_opdone = 1'b0;
      fifo_re = 1'b0;
      din_result = 32'b0;
      wAddr = 4'b0;end
   else if(multi_opclear) begin//reset_n == 1 && multi_opclear == 1
      RF_we=1'b0;
      adder_opdone = 1'b0;
      fifo_re = 1'b0;
      din_result = 32'b0;
      wAddr = 4'b0;end
   else if(~adder_opstart)begin//reset_n == 1 && multi_opclear == 0 && adder_opstart == 0
      RF_we=1'b0;
      adder_opdone = 1'b0;
      fifo_re = 1'b0;
      din_result = 32'b0;
      wAddr = 4'b0;end
   else  begin // reset_n == 1 && multi_opclear == 0 && adder_opstart == 1
      if(fifo_data_count0==8)begin  //data <--8
         fifo_re = 1'b1;   
         a = add;
			RF_we = 1'b0;
			adder_opdone = 1'b0; end
      else if(fifo_data_count0==7) begin//data <--7
			fifo_re = 1'b1;
			b = add;
			adder_opdone = 1'b0;end
      else if(fifo_data_count0==6) begin//data <--6 
			fifo_re = 1'b1;
			a = add;              
			RF_we = 1'b0;
			adder_opdone = 1'b0;end
		else if(fifo_data_count0==5) begin//data <--5
			fifo_re = 1'b1;
			b = add;
			din_result = u;               
			RF_we = 1'b1;
			adder_opdone = 1'b0;
			wAddr = 4'b0;end
		else if(fifo_data_count0==4) begin//data <--4
			fifo_re = 1'b1;
			a = add;               
			RF_we = 1'b0;
			adder_opdone = 1'b0;end
		else if(fifo_data_count0==3) begin//data <--3
			fifo_re = 1'b1;
			b = add;
			din_result = u;               
			RF_we = 1'b1;
			adder_opdone = 1'b0;
			wAddr = waddr;end
		else if(fifo_data_count0==2) begin//data <--2
			fifo_re = 1'b1;
			a = add;               
			RF_we = 1'b0;
			adder_opdone = 1'b0;end
		else if(fifo_data_count0==1) begin//data <--1
			fifo_re = 1'b1;
			b = add;
			din_result = u;               
			RF_we = 1'b1;
			adder_opdone = 1'b0;
			wAddr = waddr;end
		else  if(fifo_data_count0==0) begin//setting by data_count
			if(wAddr==3)begin //adder finish
				fifo_re=1'b1;
				adder_opdone=1'b1;
				din_result=u;
				RF_we = 1'b1;end
			else if(wAddr==2)begin//S_address 3?????????????
				a=add;
				RF_we=1'b0;
				adder_opdone=1'b0;
				wAddr=waddr;end
			else if(wAddr==4)begin
				RF_we=1'b0;
				adder_opdone=1'b1;end
		end
	 end
end
endmodule 