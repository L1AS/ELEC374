`timescale 1ns / 1ps

module sub_op_tb ();
 
	parameter WIDTH = 32;
	 
	reg [WIDTH-1:0] reg_SUB_1;
	reg [WIDTH-1:0] reg_SUB_2;  
	wire [WIDTH-1:0]  w_Result;
	
	// Instantiate the device Under Test (DUT)
	sub DUT(
		.in_term1(reg_SUB_1),
		.in_term2(reg_SUB_2),
		.out_difference(w_Result)
	);
	 
	initial begin
		// Initialize inputs
		reg_SUB_1 = 0;
		reg_SUB_2 = 0;
		
		// Global reset
		#100;
		
		// case 1: 0 - 1 = -1
		reg_SUB_1 = 32'd0;
		reg_SUB_2 = 32'd1;
		#10;
		
		// case 2: 2 - 2 = 0
		reg_SUB_1 = 32'd2;
		reg_SUB_2 = 32'd2;
		#10;
		
		// case 3: Requires a carry, -5 - 6 = -11 
		reg_SUB_1 = -32'd5;
		reg_SUB_2 = 32'd6;
		#10;
		// case 4: Requires a carry, -7 - (-7) = 0 
		reg_SUB_1 = -32'd7;
		reg_SUB_2 = -32'd7;
		#10;
	end
endmodule