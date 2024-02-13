module cla_gen#(parameter WIDTH = 32)(
    input [WIDTH-1:0] in_add1, in_add2,
    input Cin,  // carry in
    output [WIDTH-1:0] out_Sum
);

	wire [WIDTH:0] wire_C; // carry intermediate
	wire [WIDTH-1:0] wire_G, wire_P, wire_SUM; // carry generate, carry propagate, sum

	// full adder, consider use generate function in verilog
	genvar i;
	generate
		 for (i = 0; i < WIDTH; i = i + 1) 
		 begin: gen_sum
			  full_adder full_adder_i (
					.in_A (in_add1[i]),
					.in_B (in_add2[i]),
					.Cin (wire_C[i]),
					.out_Sum (wire_SUM[i]),
					.Cout()
			  );
		 end
	endgenerate

	assign wire_C[0] = 1'b0;
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

	// Concatenation
	assign out_Sum = {wire_C[WIDTH], wire_SUM};

endmodule