module Multiplier(clk,fifo_data_count0,fifo_data_count1,reset_n,multi_opstart, multi_opclear, multiplicand, multiplier, din_result, fifo_re,fifo_we,multi_opdone);
input clk, reset_n;//input clk, reset_n
input multi_opclear,multi_opstart; //op_clear,op_start
input [31:0] multiplicand, multiplier;//input matrix value
input[3:0] fifo_data_count0,fifo_data_count1;//input for fifo's data count
output multi_opdone;//multi done
output [31:0] din_result;//result
output fifo_re,fifo_we; // fifo signal
// wire for connecting modules
wire [1:0] a_state,a1_next_state;
wire [63:0] b_result;
wire [3:0] c_exec_count,c_count;                     
os_logic      U1_os_logic(.clk(clk), .state(a_state), .result_in(b_result), .result_out(din_result), .fifo_re(fifo_re),.fifo_we(fifo_we),.multi_opdone(multi_opdone), .fifo_data_count0(fifo_data_count0), .fifo_data_count1(fifo_data_count1));
//os logic
ns_state      U0_ns_state(.reset_n(reset_n), .state(a_state), .op_start(multi_opstart), .op_clear(multi_opclear),
                        .exec_count_in(c_count), .next_state(a1_next_state));
//ns logic
EXEC_cal      U2_EXEC_cal(.clk(clk) , .state(a_state), .multiplicand_a(multiplicand), .multiplier_x(multiplier), 
      .exec_count_in(c_count), .temp_result(b_result), .exec_count_out(c_exec_count));   
//calcultating logic
dff_2_r      U3_state(.clk(clk),.reset_n(reset_n),.d(a1_next_state),.q(a_state));
dff_4_r      U4_count(.clk(clk),.reset_n(reset_n),.d(c_exec_count),.q(c_count));   

endmodule

