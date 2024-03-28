module add_op#(parameter WIDTH = 32)(
	output signed [WIDTH-1:0] add_out,
	// output Cout, // carry out
	input signed [WIDTH-1:0] A_reg, B_reg,
	input Cin  // carry in
);

	wire [WIDTH:0] wire_C; // carry intermediate
	// Generate Terms G = A * B (a.k.a A AND B)
	// Propogate Terms P = A XOR B or A OR B 
	wire [WIDTH-1:0] wire_G, wire_P; // carry generate, carry propagate
	wire signed [WIDTH-1:0] wire_SUM; // sum

	assign wire_C[0] = Cin;

	// use bit cell logic to generate sum, carry out, 
	// generate term, and propagate term repsectively
	genvar i;
	generate
		for (i = 0; i < WIDTH; i = i + 1) begin
			assign wire_G[i] = A_reg[i] & B_reg[i];
			assign wire_P[i] = A_reg[i] ^ B_reg[i];
		end
	endgenerate

	generate
		for (i = 0; i < WIDTH; i = i + 1) begin
			assign wire_C[i+1] = wire_G[i] | (wire_P[i] & wire_C[i]); // Ci+1 = Gi OR PiCi
		end
	endgenerate

	generate
		for (i = 0; i < WIDTH; i+1) begin
			assign add_out[i] = wire_P[i] ^ wire_C[i]; // equivalent to in_A XOR in_B XOR Cin
		end
	endgenerate
	// Assign adder result and carry out
	// assign Cout = wire_C [WIDTH];

endmodule