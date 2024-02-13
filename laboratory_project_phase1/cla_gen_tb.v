`timescale 1ns / 1ps

module cla_gen_tb ();
 
	parameter WIDTH = 32;
	 
	reg [WIDTH-1:0] reg_ADD_1, reg_ADD_2;
	reg reg_Cin;  
	wire [WIDTH-1:0]  w_Result;
	wire w_Cout;
	// Instantiate the device Under Test (DUT)
	cla_gen DUT (
		.in_add1 (reg_ADD_1),
		.in_add2 (reg_ADD_2),
		.Cin (reg_Cin),
		.out_Sum (w_Result),
		.Cout (w_Cout)
	);
	 
	initial begin
		// Initialize inputs
		reg_ADD_1 = 0;
		reg_ADD_2 = 0;
		reg_Cin = 0;
		
		// Global reset
		#100;
		
		// case 1: 0 + 1 = 1
		reg_ADD_1 = 32'd0;
		reg_ADD_2 = 32'd1;
		reg_Cin = 0;
		#10;
		
		// case 2: 2 + 2 + 1 = 5
		reg_ADD_1 = 32'd2;
		reg_ADD_2 = 32'd2;
		reg_Cin = 1;
		#10;
		
		// case 3: Requires a carry, -5 + 6 = 1 
		reg_ADD_1 = -32'd5;
		reg_ADD_2 = 32'd6;
		reg_Cin = 0;
		#10;
		// case 4: Requires a carry, -7 + (-7) + 1 = -13
		reg_ADD_1 = -32'd7;
		reg_ADD_2 = -32'd7;
		reg_Cin = 1;
		#10;
	end
endmodule