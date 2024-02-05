module cla_gen#(parameter = WIDTH)(
    input [WIDTH-1:0] in_A, in_B,
    input Cin,  // carry in
    output [WIDTH-1:0] out_Sum,
);

wire [WIDTH:0] wire_C; // carry intermediate
wire [WIDTH-1:0] wire_G, wire_P, w_SUM; // carry generate, carry propagate, sum

// full adder, consider use generate function in verilog

// G = A * B (a.k.a A AND B)
assign G = in_A & in_B; 
// P = A XOR B
