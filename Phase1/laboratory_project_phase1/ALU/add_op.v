module add_op#(parameter WIDTH = 32)(
	output signed [WIDTH-1:0] add_out,
	input signed [WIDTH-1:0] A_reg, B_reg,
	input Cin  // carry in
	// output [WIDTH:0] Cout
);

	wire [WIDTH:0] wire_C; // carry intermediate
	wire [WIDTH-1:0] wire_G, wire_P; // carry generate, carry propagate
	wire signed [WIDTH-1:0] wire_SUM; // sum
	// full adder, consider use generate function in verilog
	genvar i;
	generate
		for (i = 0; i < WIDTH; i = i + 1) 
		begin: gen_sum
			b_cell b_cell_i (
				.in_A (A_reg[i]),
				.in_B (B_reg[i]),
				.Cin (wire_C[i]),
				.out_Sum (wire_SUM[i]),
				.Cout()
			);
		end
	endgenerate

	assign wire_C[0] = Cin;
	// Generate Terms G = A * B (a.k.a A AND B)
	// P = A XOR B or A OR B
	genvar j;
	generate
		for (j = 0; j < WIDTH; j = j + 1)
		begin: gen_genrate_terms
			assign wire_G[j] = A_reg[j] & B_reg[j];
			assign wire_P[j] = A_reg[j] ^ B_reg[j];
			assign wire_C[j+1] = wire_G[j] | (wire_P[j] & wire_C[j]);    
		end
	endgenerate

	// Assign cla result and carry out
	assign add_out = wire_SUM [WIDTH-1:0];
	// assign Cout = wire_C [WIDTH:0];

endmodule