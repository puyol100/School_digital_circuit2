//inverter
module _inv(a,y); // The module declaration, module name is _inv and (a, y) is declared as variable.
input a; // Declare a as input variables.
output y; // Declare y as output variables.
assign y=~a; // Define y as ~a.
endmodule // Exit the module.

// 2-to-1 nand gate
module _nand2(a,b,y); // The module declaration, module name is _nand2 and (a, b, y) is declared as variable.
input a,b; // Declare a, b as input variables.
output y; // Declare y as output variables.
assign y=~(a&b); // Define y as ~(a&b).
endmodule // Exit the module.

//2-to-1 and gate
module _and2(a,b,y); // The module declaration, module name is _and2 and (a, b, y) is declared as variable.
input a,b;  // Declare a, b as input variables.
output y; // Declare y as output variables.
assign y=a&b; // Define y as (a&b).
endmodule // Exit the module.

//2-to-1 or gate
module _or2(a,b,y); // The module declaration, module name is _or2 and (a, b, y) is declared as variable.
input a,b; // Declare a, b as input variables.
output y;  // Declare y as output variables.
assign y=a|b; // Define y as a|b.
endmodule // Exit the module.

//2-to-1 xor gate
module _xor2(a,b,y); // The module declaration, module name is _xor2 and (a, b, y) is declared as variable.
input a, b; // Declare a, b as input variables.
output y; // Declare y as output variables.
wire inv_a, inv_b; // Declare wire variable inv_a, inv_b
wire w0, w1; // Declare wire variable w0, w1
_inv U0_inv(.a(a), .y(inv_a)); // declares U0_inv of type _inv and receives (.a(a), .y(inv_a)) as a variable.
_inv U1_inv(.a(b), .y(inv_b)); // declares U1_inv of type _inv and receives (.a(b), .y(inv_b)) as a variable.
_and2 U2_and2(.a(inv_a), .b(b), .y(w0)); // declares U2_and2 of type _and2 and receives (.a(inv_a), .b(b), .y(w0)) as a variable.
_and2 U3_and2(.a(a),.b(inv_b), .y(w1));  // declares U3_and2 of type _and2 and receives (.a(a),.b(inv_b), .y(w1)) as a variable.
_or2 U4_or2(.a(w0), .b(w1),.y(y)); // declares U4_or2 of type _or2 and receives (.a(w0), .b(w1),.y(y)) as a variable.
endmodule // Exit the module.

// 3-to-1 and gate
module _and3(a,b,c,y); // The module declaration, module name is _and3 and (a, b, c, y) is declared as variable.
input a,b,c; // input variables a,b,c are declared
output y; // output variable y is declared
assign y=a&b&c; // define y as a&b&c
endmodule // Exit the module.

// 3-to-1 or gate
module _or3(a,b,c,y); // The module declaration, module name is _or3 and (a, b, c, y) is declared as variable.
input a,b,c; // input variables a,b,c are declared
output y; // output variable y is declared
assign y=a|b|c; // define y as a|b|c
endmodule // Exit the module.

// 4-to-1 and gate
module _and4(a,b,c,d,y);// The module declaration, module name is _and4 and (a, b, c, d, y) is declared as variable.
input a,b,c,d; // input variables a,b,c,d are declared
output y;// output variable y is declared
assign y=a&b&c&d; // define y as a&b&c&d
endmodule // Exit the module.

// 4-to-1 or gate
module _or4(a,b,c,d,y); // The module declaration, module name is _or4 and (a, b, c, d, y) is declared as variable.
input a,b,c,d;  // input variables a,b,c,d are declared
output y;// output variable y is declared
assign y=a|b|c|d; // define y as a|b|c|d
endmodule // Exit the module.

// 5-to-1 and gate
module _and5(a,b,c,d,e,y); // The module declaration, module name is _and5 and (a, b, c, d, e, y) is declared as variable.
input a,b,c,d,e;  // input variables a,b,c,d,e are declared
output y;// output variable y is declared
assign y=a&b&c&d&e; // define y as a&b&c&d&e
endmodule // Exit the module.

// 5-to-1 or gate
module _or5(a,b,c,d,e,y); // The module declaration, module name is _or5 and (a, b, c, d, e, y) is declared as variable.
input a,b,c,d,e;  // input variables a,b,c,d,e are declared
output y;// output variable y is declared
assign y=a|b|c|d|e; // define y as a|b|c|d|e
endmodule // Exit the module.

// 4-bit inverter
module _inv_4bits(a,y); // The module declaration, module name is _inv_4bits and (a, y) is declared as variable.
input [3:0] a; // [3:0] array input variables a is declared
output [3:0] y; // [3:0] array output  variable y is declared
assign y=~a; // define y as ~a
endmodule // Exit the module.

// 4-bit 2-to-1 and gate
module _and2_4bits(a,b,y); // The module declaration, module name is _and2_4bits and (a, b, y) is declared as variable.
input [3:0] a,b;  // [3:0] array input variables a,b are declared
output [3:0] y; // [3:0] array output  variable y is declared
assign y=a&b; // define y as a&b
endmodule // Exit the module.

// 4-bit 2-to-1 or gate
module _or2_4bits(a,b,y); // The module declaration, module name is _or2_4bits and (a, b, y) is declared as variable.
input [3:0] a,b; // [3:0] array input variables a,b are declared
output [3:0] y; // [3:0] array output  variable y is declared
assign y=a|b; // define y as a|b
endmodule // Exit the module.

// 4-bit 2-to-1 exclusive or gate(XOR)
module _xor2_4bits(a,b,y); // The module declaration, module name is _xor2_4bits and (a, b, y) is declared as variable.
input [3:0] a,b; // [3:0] array input variables a,b are declared
output [3:0] y; // [3:0] array output  variable y is declared
_xor2 U0_xor2(.a(a[0]),.b(b[0]),.y(y[0])); // instanciating _xor2 module U0_xor2
_xor2 U1_xor2(.a(a[1]),.b(b[1]),.y(y[1])); // instanciating _xor2 module U1_xor2
_xor2 U2_xor2(.a(a[2]),.b(b[2]),.y(y[2])); // instanciating _xor2 module U2_xor2
_xor2 U3_xor2(.a(a[3]),.b(b[3]),.y(y[3])); // instanciating _xor2 module U3_xor2
endmodule // Exit the module.

// 4-bit 2-to-1 exclusive nor gate(XNOR)
module _xnor2_4bits(a,b,y); // The module declaration, module name is _xnor2_4bits and (a, b, y) is declared as variable.
input [3:0] a,b; // [3:0] array input variables a,b are declared
output [3:0] y; // [3:0] array output  variable y is declared
wire [3:0] w0; // [3:0] array wire variable w0 is declared
_xor2_4bits U0_xor2_4bits(.a(a),.b(b),.y(w0)); // instanciating _xor2_4bits module U0_xor2_4bits
_inv_4bits U1_inv_4bits(.a(w0),.y(y)); // instanciating _inv_4bits module U1_inv_4bits
endmodule // Exit the module.

// 32bit inverter
module _inv_32bits(a,y); // The module declaration, module name is _inv_32bits and (a, y) is declared as variable.
input [31:0] a; // [31:0] array input variables a is declared
output [31:0] y; // [31:0] array output variables y is declared
assign y=~a; // define y as ~a
endmodule // Exit the module

// 32bit 2-to-1 and gate
module _and2_32bits(a,b,y); // The module declaration, module name is _and2_32bits and (a, b, y) is declared as variable.
input [31:0] a,b; // [31:0] array input variables a,b are declared
output [31:0] y; // [31:0] array output variables y is declared
assign y=a&b;   // define y as a&b
endmodule // end of module

// 32bit 2-to-1 or gate
module _or2_32bits(a,b,y); // The module declaration, module name is _or2_32bits and (a, b, y) is declared as variable.
input [31:0] a,b; // [31:0] array input variables a,b are declared
output [31:0] y;  // [31:0] array output variables y is declared
assign y=a|b; // define y as a|b
endmodule // end of module

// 32bit exclusive or gate
module _xor2_32bits(a,b,y);  // The module declaration, module name is _xor2_32bits and (a, b, y) is declared as variable.
input [31:0] a,b; // [31:0] array input variables a,b are declared
output [31:0] y; // [31:0] array output variables y is declared
_xor2_4bits U0_xor2_4bits(.a(a[3:0]),.b(b[3:0]),.y(y[3:0])); // instanciating _xor2 module U0_xor2_4bits
_xor2_4bits U1_xor2_4bits(.a(a[7:4]),.b(b[7:4]),.y(y[7:4])); // instanciating _xor2 module U1_xor2_4bits
_xor2_4bits U2_xor2_4bits(.a(a[11:8]),.b(b[11:8]),.y(y[11:8])); // instanciating _xor2 module U2_xor2_4bits
_xor2_4bits U3_xor2_4bits(.a(a[15:12]),.b(b[15:12]),.y(y[15:12])); // instanciating _xor2 module U3_xor2_4bits
_xor2_4bits U4_xor2_4bits(.a(a[19:16]),.b(b[19:16]),.y(y[19:16])); // instanciating _xor2 module U4_xor2_4bits
_xor2_4bits U5_xor2_4bits(.a(a[23:20]),.b(b[23:20]),.y(y[23:20])); // instanciating _xor2 module U5_xor2_4bits
_xor2_4bits U6_xor2_4bits(.a(a[27:24]),.b(b[27:24]),.y(y[27:24])); // instanciating _xor2 module U6_xor2_4bits
_xor2_4bits U7_xor2_4bits(.a(a[31:28]),.b(b[31:28]),.y(y[31:28])); // instanciating _xor2 module U7_xor2_4bits
endmodule // end of module

// 32bit exclusive nor gate
module _xnor2_32bits(a,b,y); // The module declaration, module name is _xnor2_32bits and (a, b, y) is declared as variable.
input [31:0] a,b; // [31:0] array input variables a,b are declared
output [31:0] y; // [31:0] array output variables y is declared
_xnor2_4bits U0_xnor2_4bits(.a(a[3:0]),.b(b[3:0]),.y(y[3:0])); // instanciating _xnor2 module U0_xnor2_4bits
_xnor2_4bits U1_xnor2_4bits(.a(a[7:4]),.b(b[7:4]),.y(y[7:4])); // instanciating _xnor2 module U1_xnor2_4bits
_xnor2_4bits U2_xnor2_4bits(.a(a[11:8]),.b(b[11:8]),.y(y[11:8])); // instanciating _xnor2 module U2_xnor2_4bits
_xnor2_4bits U3_xnor2_4bits(.a(a[15:12]),.b(b[15:12]),.y(y[15:12])); // instanciating _xnor2 module U3_xnor2_4bits
_xnor2_4bits U4_xnor2_4bits(.a(a[19:16]),.b(b[19:16]),.y(y[19:16])); // instanciating _xnor2 module U4_xnor2_4bits
_xnor2_4bits U5_xnor2_4bits(.a(a[23:20]),.b(b[23:20]),.y(y[23:20])); // instanciating _xnor2 module U5_xnor2_4bits
_xnor2_4bits U6_xnor2_4bits(.a(a[27:24]),.b(b[27:24]),.y(y[27:24])); // instanciating _xnor2 module U6_xnor2_4bits
_xnor2_4bits U7_xnor2_4bits(.a(a[31:28]),.b(b[31:28]),.y(y[31:28])); // instanciating _xnor2 module U7_xnor2_4bits
endmodule // end of module

// 2-to-1 nor gate

module _nor2(a,b,y); // The module declaration, module name is _nor2 and (a, b, y) is declared as variable.
	input a,b; // input variables a,b are declared
	output y; // output variable y is declared
	assign y = ~(a|b); // define y as ~(a|b)
endmodule // end of module







