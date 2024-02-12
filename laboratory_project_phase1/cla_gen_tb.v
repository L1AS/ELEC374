`timescale 1ns / 1ps

module cla_gen_tb ();
 
	parameter WIDTH = 32;
	 
	reg [WIDTH-1:0] reg_ADD_1;
	reg [WIDTH-1:0] reg_ADD_2;  
	wire [WIDTH-1:0]  w_Result;
	
	// Instantiate the device Under Test (DUT)
	cla_gen DUT(
		.in_add1(reg_ADD_1),
		.in_add2(reg_ADD_2),
		.out_Sum(w_Result)
	);
	 
	initial begin
		// Initialize inputs
		reg_ADD_1 = 0;
		reg_ADD_2 = 0;
		
		// Global reset
		#100;
		
		// case 1: 0 + 1 = 1
		reg_ADD_1 = 32'd0;
		reg_ADD_2 = 32'd1;
		#10;
		
		// case 2: 2 + 2 = 4
		reg_ADD_1 = 32'd2;
		reg_ADD_2 = 32'd2;
		#10;
		
		// case 3: Requires a carry, -5 + 6 = 1 
		reg_ADD_1 = -32'd5;
		reg_ADD_2 = 32'd6;
		#10;
		// case 4: Requires a carry, -7 + (-7) = -14 
		reg_ADD_1 = -32'd7;
		reg_ADD_2 = -32'd7;
		#10;
	end
endmodule