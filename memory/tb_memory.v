`timescale 1ns/100ps//setting timescale

module tb_memory;//tb for memory

   reg tb_clk;
   reg tb_cen, tb_wen;
   reg [4:0] tb_addr;
   reg [31:0] tb_din;
   
   wire [31:0] tb_dout;
   //test bench input output
   memory U0_mem(.clk(tb_clk), .cen(tb_cen), .wen(tb_wen), .addr(tb_addr), .din(tb_din), .dout(tb_dout));
   //instance for tesbench
   always
   begin
      tb_clk=1; #5; tb_clk=0; #5;
   end//setting clk pulse
   
   initial
   begin//start the test
      tb_cen=0; tb_wen=0; tb_addr=0; tb_din=0;
      #17; tb_cen=1; tb_wen=1;
      #10; tb_addr=1; tb_din=1;
      #10; tb_addr=2; tb_din=2;
      #10; tb_addr=3; tb_din=3;
      #10; tb_addr=10; tb_din=10;
      
      #10; tb_wen=0; tb_addr=1;
      #10; tb_addr=2;
      #10; tb_addr=3;
      #10; tb_addr=10;
      #10; $stop;
   end
endmodule 