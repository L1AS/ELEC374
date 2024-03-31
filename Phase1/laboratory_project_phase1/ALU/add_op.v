module add_op#(parameter WIDTH = 32)(
<<<<<<< HEAD
	input signed [WIDTH-1:0] in_add1, in_add2,
	input Cin,  // carry in
	output signed [WIDTH-1:0] out_Sum
	// output [WIDTH:0] Cout
=======
	output signed [WIDTH-1:0] add_out,
	// output [WIDTH:0] Cout
	input signed [WIDTH-1:0] A_reg, B_reg,
	input Cin  // carry in
>>>>>>> main
);

	wire [WIDTH:0] wire_C; // carry intermediate
	wire [WIDTH-1:0] wire_G, wire_P; // carry generate, carry propagate
	wire signed [WIDTH-1:0] wire_SUM; // sum
<<<<<<< HEAD
	// bit cell circuitry, use a loop to go through all 32 bits
=======

	assign wire_C[0] = Cin;

	// use bit cell logic to generate sum, carry out, 
	// generate term, and propagate term repsectively
>>>>>>> main
	genvar i;
	generate
		for (i = 0; i < WIDTH; i = i + 1) 
		begin: gen_sum
			b_cell b_cell_i (
<<<<<<< HEAD
				.in_A (in_add1[i]),
				.in_B (in_add2[i]),
				.Cin (wire_C[i]),
				.out_Sum (wire_SUM[i]),
				.Cout()
=======
				.in_A (A_reg[i]),
				.in_B (B_reg[i]),
				.Cin (wire_C[i]),
				.out_Propagate(wire_P[i]),
				.out_Generate(wire_G[i]),
				.out_Sum (wire_SUM[i]),
				.Cout(wire_C[i+1])
>>>>>>> main
			);
		end
	endgenerate

<<<<<<< HEAD
	assign wire_C[0] = Cin;
	// Generate Terms G = A * B (a.k.a A AND B)
	// P = A XOR B or A OR B
	genvar j;
	generate
		for (j = 0; j < WIDTH; j = j + 1)
		begin: gen_genrate_terms
			assign wire_G[j] = in_add1[j] & in_add2[j];
			assign wire_P[j] = in_add1[j] ^ in_add2[j];
			assign wire_C[j+1] = wire_G[j] | (wire_P[j] & wire_C[j]);    
		end
	endgenerate

	// Assign cla result and carry out
	assign out_Sum = wire_SUM [WIDTH-1:0];
=======
	// Assign adder result and carry out
	assign add_out = wire_SUM [WIDTH-1:0];
>>>>>>> main
	// assign Cout = wire_C [WIDTH:0];

endmodule