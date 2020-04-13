`timescale 1ns/100ps
module testbench;//testbench
reg 			clk, reset_n;
reg 			M0_req, M0_wr;
reg	[7:0]	M0_address;
reg	[31:0]	M0_dout;
//reg for test input 
wire			M0_grant, M1_grant;
wire	[31:0]	M_din;
wire			m_interrupt;
wire multi_opdone;
//wire for test output
always #5 clk = ~clk;
//clock pusle
TOP U0_TOP(.clk(clk), .reset_n(reset_n), .M0_req(M0_req), .M0_wr(M0_wr), .M0_address(M0_address), .M0_dout(M0_dout), .M0_grant(M0_grant), .M1_grant(M1_grant), .M_din(M_din), .m_interrupt(m_interrupt),.multi_opdone(multi_opdone));
//test TOP module
initial
begin
clk=0; reset_n=0; M0_req=0; M0_wr=0; M0_address=0; M0_dout=0; #10;//setting initial
M0_req=1; reset_n = 1; #10;//give M0_req

M0_wr=1;  M0_address=32; M0_dout=10; #10;
M0_wr=1;  M0_address=33; M0_dout=11; #10;
M0_wr=1;  M0_address=34; M0_dout=12; #10;
M0_wr=1;  M0_address=35; M0_dout=13; #10;//A Matrix write

M0_wr=1;  M0_address=64; M0_dout=14; #10;
M0_wr=1;  M0_address=65; M0_dout=15; #10;
M0_wr=1;  M0_address=66; M0_dout=16; #10;
M0_wr=1;  M0_address=67; M0_dout=17; #10;//B Matrix write

M0_wr=0;  M0_address=32; M0_dout=0; #10;
M0_wr=0;  M0_address=33; #10;
M0_wr=0;  M0_address=34; #10;
M0_wr=0;  M0_address=35;  #10;//read A Matrix

M0_wr=0;  M0_address=64;  #10;
M0_wr=0;  M0_address=65;  #10;
M0_wr=0;  M0_address=66;#10;
M0_wr=0;  M0_address=67;#10;//read B Matrix

M0_wr=0;  M0_address=32; M0_dout=10; #10;
M0_wr=1;  M0_address=0; M0_dout=0; #10;
M0_wr=0;  M0_address=33; M0_dout=11; #10;
M0_wr=1;  M0_address=0; M0_dout=0; #10;
M0_wr=0;  M0_address=32; M0_dout=10; #10;
M0_wr=1;  M0_address=0; M0_dout=0; #10;
M0_wr=0;  M0_address=33; M0_dout=11; #10;
M0_wr=1;  M0_address=0; M0_dout=0; #10;
M0_wr=0;  M0_address=34; M0_dout=12; #10;
M0_wr=1;  M0_address=0; M0_dout=0; #10;
M0_wr=0;  M0_address=35; M0_dout=13; #10;
M0_wr=1;  M0_address=0; M0_dout=0; #10;
M0_wr=0;  M0_address=34; M0_dout=12; #10;
M0_wr=1;  M0_address=0; M0_dout=0; #10;
M0_wr=0;  M0_address=35; M0_dout=13; #10;
M0_wr=1;  M0_address=0; M0_dout=0; #10;//Go to fifo

M0_wr=0; M0_address=64; M0_dout=14; #10;
M0_wr=1;  M0_address=1; M0_dout=0; #10;
M0_wr=0; M0_address=66; M0_dout=16; #10;
M0_wr=1;  M0_address=1; M0_dout=0; #10;
M0_wr=0; M0_address=65; M0_dout=15; #10;
M0_wr=1;  M0_address=1; M0_dout=0; #10;
M0_wr=0; M0_address=67; M0_dout=17; #10;
M0_wr=1;  M0_address=1; M0_dout=0; #10;
M0_wr=0; M0_address=64; M0_dout=14; #10;
M0_wr=1;  M0_address=1; M0_dout=0; #10;
M0_wr=0; M0_address=66; M0_dout=16; #10;
M0_wr=1;  M0_address=1; M0_dout=0; #10;
M0_wr=0; M0_address=65; M0_dout=15; #10;
M0_wr=1;  M0_address=1; M0_dout=0; #10;
M0_wr=0; M0_address=67; M0_dout=17; #10;
M0_wr=1;  M0_address=1; M0_dout=0; #10;//GO to fifo

M0_wr=1;  M0_address=3; M0_dout=1; #10;//multiple start;
while(!multi_opdone) #10;//utill multi over
M0_wr=1;  M0_address=2; M0_dout=1; #10;//interrupt  enable
M0_wr=1;  M0_address=4; M0_dout=1; #10;//add start;
while(!m_interrupt) #10;//until m_interrupt == 1'b0
#20;
$stop;
end
endmodule 