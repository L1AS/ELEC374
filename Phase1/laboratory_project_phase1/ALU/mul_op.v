module mul_op(
  output [63:0] mul_out,
  input signed [31:0] A_reg, B_reg        
);

	
	reg [32:0] partp[15:0]; // Partial products
	reg [63:0] spartp[15:0]; // Sign-extended partial products
	reg [2:0] contc[15:0]; // Control codes for partial product generation
	reg [63:0] prod;	// finall product

	integer i, j; 
	wire [32:0] inv_A = {~A_reg[31], -A_reg};
	
	always @(*) begin
		contc[0] = {B_reg[1], B_reg[0], 1'b0}; // initialize control code for LSBs
		
		// Generate control codes
		for (j=1; j < 16; j = j+1)
			contc[j] = {B_reg[2*j+1], B_reg[2*j], B_reg[2*j-1]};

		for (j=0; j < 16; j = j+1) begin	
			case(contc[j])
				3'b001, 3'b010 : partp[j] = {A_reg[31], A_reg}; // 'A_reg' or 'A_reg' shifted
				3'b011 : partp[j] = {A_reg, 1'b0}; // 'A_reg' shifted left
				3'b100 : partp[j] = {inv_A[31:0], 1'b0}; // '-A_reg' shifted left
				3'b101, 3'b110 : partp[j] = inv_A; // '-A_reg'
				default : partp[j] = 0;
			endcase
			spartp[j] = $signed(partp[j]); // Sign-extend
			for (i=0; i<j; i = i + 1)
				spartp[j] = {spartp[j], 2'b00}; // Align partial product
		end
	
    prod = 32'b0;
		for (j=0; j < 16; j = j+1)
			prod = prod + spartp[j]; // Accumulate
	end
	
	assign mul_out = prod; 
endmodule
