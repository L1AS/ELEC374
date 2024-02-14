module mul_op (
	input signed [31:0] a, b, //multiplicand and multiplier
	output signed [63:0] z 
);
	reg [63:0] partprod[31:0];
	reg [63:0] spartprod [15:0];	// signed partial product
	reg [2:0] carry_control [15:0];
	reg [63:0] product;
	
	assign z = 32'b0;




endmodule