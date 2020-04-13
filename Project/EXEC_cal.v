module EXEC_cal(clk, state, multiplicand_a, multiplier_x, exec_count_in, temp_result, exec_count_out);
input clk;
input [1:0] state;
input [31:0] multiplicand_a, multiplier_x;
input [3:0] exec_count_in;
output reg [3:0] exec_count_out; // if EXEC state, this variable will +1
output reg [63:0] temp_result;// result of calculating and send to os_logic
reg [31:0] u,v,a,x;//calculating table
reg [31:0] FB_X;//mirror_x;// mirror_x exists for circulating the x value
reg FBI;//Radix-4 table
parameter IDLE = 2'b00;
parameter EXEC = 2'b01;
parameter DONE   = 2'b10;//Setting parameter
wire [31:0] ua, uaa, au, aau, aa, mns1, mns2;
wire [3:0] exe;
cla32   U0_cla32(.a(u),.b(a),.ci(1'b0),.s(ua),.co());   // u+a
cla32   U1_cla32(.a(u),.b(aa),.ci(1'b0),.s(uaa),.co()); // u+2a
cla32   U2_cla32(.a(u),.b(mns1),.ci(1'b0),.s(au),.co()); // u-a
cla32   U4_cla32(.a(a),.b(a),.ci(1'b0),.s(aa),.co()); // 2a
cla32   U5_cla32(.a(u),.b(mns2),.ci(1'b0),.s(aau),.co()); // u-2a
cla32   U6_cla32(.a(exec_count_out),.b(4'b1),.ci(1'b0),.s(exe),.co()); // exec_count
cla32   U7_cla32(.a(32'b1),.b(~a),.ci(1'b0),.s(mns1),.co()); // 2's com -a
cla32   U8_cla32(.a(mns1),.b(mns1),.ci(1'b0),.s(mns2),.co()); // 2's com -2a
always @(posedge clk)
begin      
   if(exec_count_in === 4'b1111)   begin
   temp_result = {u,v};
   end
   else
   case(state)//Case by state
   IDLE   :begin               
      exec_count_out = 4'b0000;
      temp_result= 64'h0;
      u= 32'h00000000;
      v= 32'h00000000;
      a= multiplicand_a;
      x= multiplier_x;
      FB_X = 32'h00000000;
      FBI= 1'b0;end
   EXEC   : begin
      case({x[1:0],FBI}) 
         3'b000   :   begin      // 0 and shifting 2
            u   =  u;
            v   = ( v >> 2);   // shifting the v value.
            v[31:30] = u[1:0];      // shifting the 2bit of u
            u   = (u >> 2);   // shifting 2
            u[31] =  u[29];
            u[30] =   u[29]; end
         3'b001   :   begin      // A and shifting 2
            u = ua;      //  add multiplicand
            v  = ( v >> 2);   // shifting the v value.
            v[31:30] = u[1:0];      // shifting the 2bit of u
            u  = (u >> 2);   // shifting 2
            u[31] =  u[29];
            u[30] =    u[29]; end
			3'b101   :   begin      // -A and shifting 2
            u =  au;               // sub multiplicand
            v = ( v >> 2);   // shifting the v value.
            v[31:30]= u[1:0];      // shifting the 2bit of u
            u= (u >> 2);   // shifting 2
            u[31]=  u[29];
            u[30]  =    u[29];end
			3'b011   :   begin      // 2A and shifting 2
            u = uaa;            //  add two multiplicand
            v     = ( v >> 2);   // shifting the v value.
            v[31:30] = u[1:0];      // shifting the 2bit of u
            u   = (u >> 2);   // shifting 2
            u[31]  =  u[29];
            u[30]  =    u[29];end
         3'b010   :   begin      // A and shifting 2
            u = ua;               //  add multiplicand
            v  = ( v >> 2);   // shifting the v value.
            v[31:30] = u[1:0];      // shifting the 2bit of u
            u  = (u >> 2);   // shifting 2
            u[31] =  u[29];
            u[30] =    u[29];end
         3'b100   :   begin      // -2A and shifting 2
            u =  aau;            // sub two multiplicand
            v = ( v >> 2);   // shifting the v value.
            v[31:30] = u[1:0];      // shifting the 2bit of u
            u = (u >> 2);   // shifting 2
            u[31]=  u[29];
            u[30] =    u[29];end
         3'b111   :   begin      // 0 and shifting 2
            u   =  u;
            v  = ( v >> 2);   // shifting the v value.
            v[31:30] = u[1:0];      // shifting the 2bit of u
            u   = (u >> 2);   // shifting 2
            u[31] =  u[29];
            u[30]  = u[29];end
			3'b110   :   begin      // -A and shifting 2
            u =  au;               // sub multiplicand
            v = ( v >> 2);   // shifting the v value.
            v[31:30] = u[1:0];
            u  = (u >> 2);   // shifting 2
            u[31]  =  u[29];
            u[30]   =    u[29];end
         default   :   begin      // set exception handling
            u = 32'hx;
            v = 32'hx;
            temp_result = 64'hx;
         end
      endcase
      exec_count_out =  exe;   // counting exec_count
      FBI = x[1]; // set FBI for Radix 4 table
      FB_X = x;
      x         = ( x >> 2);
      x[31:30]   = FB_X[1:0];// circulating the x value
   end
   DONE   : begin
   exec_count_out = 4'b0000;end
   endcase
end                   
endmodule
