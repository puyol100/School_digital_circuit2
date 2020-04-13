`timescale 1ns/100ps //setting the timescale

module tb_alu32;
	
	reg tb_clk, tb_reset; //for tb clock and reset
	reg [31:0] vectornum, errors; 
	reg [103:0] testvectors[100:0]; // array of testvectors
	reg [31:0] exp_result; // value for expect result
	reg exp_c, exp_n, exp_z, exp_v; //value for expect flags
	
	
	reg [31:0] tb_a, tb_b; //tb input value
	reg [2:0] tb_op; //tb opcode
	reg dummy; //for dummy value
	wire [31:0] tb_result; //tb result value
	wire tb_c, tb_n, tb_z, tb_v; //tb flags
	
	alu32 U0_alu32(.a(tb_a), .b(tb_b), .op(tb_op), .result(tb_result), .c(tb_c), .n(tb_n), .z(tb_z), .v(tb_v)); //instance alu32
	
	always
	begin//generate clock signal
		tb_clk = 1; #5; tb_clk = 0; #5; //setting for inverting clock signal
	end
	
	initial
		begin
			$readmemh("./../../example.tv",testvectors); //readmem in example.tv
			vectornum=0; errors=0; tb_reset=1; #4; tb_reset=0;
		end
	
	
	always @ (posedge tb_clk) //clock signal change
		begin
			#1; {tb_a, tb_b, dummy, tb_op, exp_result, exp_c, exp_n, exp_z, exp_v} = testvectors[vectornum]; //data is stored 
		end
	
	always @ (negedge tb_clk) //clock signal change
		if(~tb_reset) 
			begin //start test bench
				if(tb_result !== exp_result || tb_c !== exp_c || tb_n !== exp_n || tb_z !== exp_z || tb_v !== exp_v) 
					begin //
						$display("Error: inputs = a: %h, b: %h, op: %b",tb_a, tb_b, tb_op);
						$display("outputs = result: %h, c: %b, n: %b, z: %b, v: %b (%h %b %b %b %b expected)", tb_result, tb_c, tb_n, tb_z, tb_v, exp_result, exp_c, exp_n, exp_z, exp_v);
						errors = errors + 1; //if expect value != value error=error+1
					end
				vectornum = vectornum + 1; //one cycle clear vectornum = vectornum+1
			if(testvectors[vectornum] === 104'hx) 
				begin //
					$display("%d tests completed with %d errors", vectornum, errors); 
					$finish;
				end
		end
endmodule
