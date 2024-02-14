module add_op#(parameter WIDTH = 32)(
	input signed [WIDTH-1:0] in_add1, in_add2,
	input Cin,  // carry in
	output signed [WIDTH-1:0] out_Sum
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
			Bcell Bcell_i (
				.in_A (in_add1[i]),
				.in_B (in_add2[i]),
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
			assign wire_G[j] = in_add1[j] & in_add2[j];
			assign wire_P[j] = in_add1[j] ^ in_add2[j];
			assign wire_C[j+1] = wire_G[j] | (wire_P[j] & wire_C[j]);    
		end
	endgenerate

	// Assign cla result and carry out
	assign out_Sum = wire_SUM [WIDTH-1:0];
	// assign Cout = wire_C [WIDTH:0];

endmodule