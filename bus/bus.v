module bus(clk,reset_n,M0_req,M0_wr,M0_address,M0_dout,M1_req,M1_wr,M1_address,M1_dout,S0_dout,S1_dout,M0_grant,M1_grant,M_din,S0_sel,S1_sel,S_address,S_wr,S_din);//top module
input clk,reset_n,M0_req,M0_wr;
input [7:0]M0_address;
input [31:0]M0_dout;
input M1_req,M1_wr;
input [7:0]M1_address;
input [31:0]M1_dout;
input [31:0]S0_dout;
input [31:0]S1_dout;
output M0_grant,M1_grant;
output [31:0]M_din;
output S0_sel;
output S1_sel;
output [7:0]S_address;
output S_wr;
output [31:0]S_din;	//setting port
wire [1:0] mx3_sel;//wire for register to 3_mux
//module bus_arbit(M0_req,M1_req,reset_n,clk,M1_grant,M0_grant);
bus_arbit A0(.M0_req(M0_req),.M1_req(M1_req),.reset_n(reset_n),.clk(clk),.M1_grant(M1_grant),.M0_grant(M0_grant));
//module mux2(d,b,s,y);
mux2 A1(.d(M0_wr),.b(M1_wr),.s(M0_grant),.y(S_wr));
//module mux2_8bit(d,b,s,y);
mux2_8bit A2(.d(M0_address),.b(M1_address),.s(M0_grant),.y(S_address));
//module mux2_32bit(d,b,s,y);
mux2_32bit A3(.d(M0_dout),.b(M1_dout),.s(M0_grant),.y(S_din));
//module bus_addr(address,S0_sel,S1_sel);
bus_addr	A4(.address(S_address),.S0_sel(S0_sel),.S1_sel(S1_sel));
//module module _dff_2_r(clk,reset_n,d,q);
_dff_2_r A5(.clk(clk),.reset_n(reset_n),.d({S0_sel,S1_sel}),.q(mx3_sel));
//module mux3_32bit(d,b,e,s, y); 
mux3_32bit A6(.d(32'h00),.b(S0_dout),.e(S1_dout),.s(mx3_sel),.y(M_din));
endmodule 