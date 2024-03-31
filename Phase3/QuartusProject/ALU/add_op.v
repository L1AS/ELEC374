module add_op#(parameter WIDTH = 32)(
	output signed [WIDTH-1:0] add_out,
	// output [WIDTH:0] Cout
	input signed [WIDTH-1:0] A_reg, B_reg,
	input Cin  // carry in
);

	wire [WIDTH:0] wire_C; // carry intermediate
	wire [WIDTH-1:0] wire_G, wire_P; // carry generate, carry propagate
	wire signed [WIDTH-1:0] wire_SUM; // sum

	assign wire_C[0] = Cin;

	// use bit cell logic to generate sum, carry out, 
	// generate term, and propagate term repsectively
	genvar i;
	generate
		for (i = 0; i < WIDTH; i = i + 1) 
		begin: gen_sum
			b_cell b_cell_i (
				.in_A (A_reg[i]),
				.in_B (B_reg[i]),
				.Cin (wire_C[i]),
				.out_Propagate(wire_P[i]),
				.out_Generate(wire_G[i]),
				.out_Sum (wire_SUM[i]),
				.Cout(wire_C[i+1])
			);
		end
	endgenerate

	// Assign adder result and carry out
	assign add_out = wire_SUM [WIDTH-1:0];
	// assign Cout = wire_C [WIDTH];

endmodule