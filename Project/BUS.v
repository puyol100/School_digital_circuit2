module BUS(clk, reset_n, M0_req, M0_wr, M0_address, M0_dout, M1_req, M1_wr, M1_address, M1_dout, S0_dout, S1_dout, S2_dout, S3_dout, M0_grant, M1_grant, M_din, S0_sel, S1_sel, S2_sel, S3_sel, S_address, S_wr, S_din);
	input clk, reset_n;
	input M0_req, M0_wr, M1_req, M1_wr;//M1 and M0 basic signal
	input [7:0] M0_address, M1_address;//address
	input [31:0] M0_dout, M1_dout, S0_dout, S1_dout, S2_dout, S3_dout;//out value signal come in to bus
	output M0_grant, M1_grant, S0_sel, S1_sel, S2_sel, S3_sel, S_wr;//output signal select, grant
	output [31:0] M_din, S_din;//output value
	output [7:0] S_address;//out address
	wire [3:0] S_sel;
	//instance
	dff_4_r U5_dff_4_r(.clk(clk), .reset_n(reset_n), .d({S0_sel,S1_sel,S2_sel,S3_sel}), .q(S_sel));
	bus_arbit U0_arbit(.clk(clk), .reset_n(reset_n), .M0_req(M0_req), .M1_req(M1_req), .M0_grant(M0_grant), .M1_grant(M1_grant));
	bus_addr U1_addr(.address(S_address), .S0_sel(S0_sel), .S1_sel(S1_sel), .S2_sel(S2_sel), .S3_sel(S3_sel));
	mux5_32bit U6_mux5_32(.d0(32'b0), .d1(S0_dout), .d2(S1_dout), .d3(S2_dout), .d4(S3_dout), .s(S_sel), .y(M_din));
	mx2 U2_mx2(.d0(M0_wr), .d1(M1_wr), .s(M0_grant), .y(S_wr));
	mx2_8bits U3_mx2_8(.d0(M0_address), .d1(M1_address), .s(M0_grant), .y(S_address));
	mx2_32bits U4_mx2_32(.d0(M0_dout), .d1(M1_dout), .s(M0_grant), .y(S_din));
endmodule
