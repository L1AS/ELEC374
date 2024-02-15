module mul_op(
    input signed [31:0] A_reg, B_reg,  // Input operands
    output [63:0] mul_out        // Output product
);

	reg [2:0] contc[15:0]; // Control codes for partial product generation
	reg [32:0] pp[15:0]; // Partial products
	reg [63:0] spp[15:0]; // Sign-extended partial products
	
	reg [63:0] product;

	integer j,i; 
	
	wire [32:0] inv_A = {~A_reg[31], ~A_reg} + 1; // Two's complement of 'A_reg' for subtraction
	
	// Compute partial products based on control codes
	always @ (A_reg or B_reg or inv_A) begin
		contc[0] = {B_reg[1], B_reg[0], 1'b0}; // Init control code for LSBs
		
		// Generate control codes
		for (j=1; j < 16; j = j+1)
			contc[j] = {B_reg[2*j+1], B_reg[2*j], B_reg[2*j-1]};
			
		// Generate and align partial products
		for (j=0; j < 16; j = j+1) begin	
			case(contc[j])
				3'b001, 3'b010 : pp[j] = {A_reg[31], A_reg}; // 'A_reg' or 'A_reg' shifted
				3'b011 : pp[j] = {A_reg, 1'b0}; // 'A_reg' shifted left
				3'b100 : pp[j] = {inv_A[31:0], 1'b0}; // '-A_reg' shifted left
				3'b101, 3'b110 : pp[j] = inv_A; // '-A_reg'
				default : pp[j] = 0;
			endcase
			spp[j] = $signed(pp[j]); // Sign-extend
			for (i=0; i<j; i = i + 1)
				spp[j] = {spp[j], 2'b00}; // Align partial product
		end
	
		product = spp[0]; // Start with the first partial product
		for (j=1; j < 16; j = j+1)
			product = product + spp[j]; // Accumulate
	end
	
	assign mul_out = product; // Output final product
endmodule
