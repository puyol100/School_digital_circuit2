module cntr8(clk, reset_n, inc, load, d_in, d_out, o_state);//cntr8
	input clk, reset_n, inc, load;//input 
	input [7:0] d_in;//input data
	output [7:0] d_out;//output data
	output [2:0] o_state;//output state
	
	wire [2:0] next_state;
	wire [2:0] state;
	
	assign o_state = state;
	//ns_logic(load, inc, state, next_state);
ns_logic U0_ns_logic(.load(load),.inc(inc),.state(state),.next_state(next_state));
	// _register3_r(clk, reset_n, d, q);
_register3_r U1_register3_r(.clk(clk),.reset_n(reset_n),.d(next_state),.q(state));
	//os_logic(state, d_in, d_out);
os_logic U2_os_logic(.state(state),.d_in(d_in),.d_out(d_out));
//instance ns_logic, os_logic, register for cntr8
endmodule 