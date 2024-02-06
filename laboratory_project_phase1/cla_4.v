module cla_4(
    input [3:0] in_A, in_B,
    input Cin,  // carry in
    output [3:0] out_Sum,
);

wire [4:0] wire_C; // carry intermediate
wire [3:0] wire_G, wire_P, wire_SUM; // generate term, propagate term, sum

// full adder applied on each bit
full_adder full_adder_bit0 (
    .in_A(in_A[0]),
    .in_B(in_B[0]),
    .Cin(wire_C[0]),
    .out_Sum(wire_SUM[0]),
    .Cout()
);

full_adder full_adder_bit1 (
    .in_A(in_A[1]),
    .in_B(in_B[1]),
    .Cin(wire_C[wire_C[1]]),
    .out_Sum(wire_SUM[1]),
    .Cout()
);

full_adder full_adder_bit2 (
    .in_A(in_A[2]),
    .in_B(in_B[2]),
    .Cin(wire_C[2]),
    .out_Sum(wire_SUM[2]),
    .Cout()
);

full_adder full_adder_bit3 (
    .in_A(in_A[3]),
    .in_B(in_B[3]),
    .Cin(wire_C[3]),
    .out_Sum(wire_SUM[3]),
    .Cout()
);
// Generate function Gi = Ai * Bi (a.k.a Ai AND Bi)
assign wire_G[0] = in_A[0] & in_B[0];
assign wire_G[1] = in_A[1] & in_B[1];
assign wire_G[2] = in_A[2] & in_B[2];
assign wire_G[3] = in_A[3] & in_B[3];
// Propagate Pi = Ai XOR Bi (or Ai OR Bi, if unsimplified)
assign wire_P[0] = in_A[0] ^ in_B[0];
assign wire_P[1] = in_A[1] ^ in_B[1];
assign wire_P[2] = in_A[2] ^ in_B[2];
assign wire_P[3] = in_A[3] ^ in_B[3];

// Carry Ci+1 = Gi + Pi * Ci
assign wire_C[0] = 1'b0;
assign wire_C[1] = wire_G[0] | (wire_P[0] & wire_C[0]);
assign wire_C[2] = wire_G[1] | (wire_P[1] & wire_C[1]);
assign wire_C[3] = wire_G[2] | (wire_P[2] & wire_C[2]);
assign wire_C[4] = wire_G[3] | (wire_P[3] & wire_C[3]);
// Sum S = in_A XOR in_B XOR wire_C
assign wire_SUM = in_A ^ in_B ^ wire_C[4:1];