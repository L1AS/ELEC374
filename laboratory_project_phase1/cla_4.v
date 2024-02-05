module cla_4(
    input [3:0] in_A, in_B,
    input Cin,  // carry in
    output [3:0] out_Sum,
);

wire [WIDTH:0] wire_C; // carry intermediate
wire [WIDTH-1:0] wire_G, wire_P, w_SUM; // carry generate, carry propagate, sum

// full adder, consider use generate function in verilog

// G = A * B (a.k.a A AND B)

// P = A XOR B