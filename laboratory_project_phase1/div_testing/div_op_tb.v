`timescale 1ns / 1ps

module div_op_tb;

  // Testbench signals
  reg signed [31:0] dividend, divisor;
  wire [31:0] remainder, quotient;
  wire error;
  // Instantiate the device Under Test (DUT)
  div_op DUT(
    .dividend(dividend),
    .divisor(divisor),
    .remainder(remainder),
	 .quotient(quotient),
	 .error(error)
  );

  initial begin
    // Initialize Inputs
    dividend = 0;
    divisor = 0;

    // Wait for global reset
    #100;

    // Test case 1: Positive division
    dividend = 100;
    divisor = 3;
    #10;

    // Test case 2: Division by zero (might need to handle this in your module)
    // dividend = 50;
    // divisor = 0;
    // #10;

    // Test case 3: Negative division
    dividend = -100;
    divisor = 4;
    #10;

    // Test case 4: Both dividend and divisor negative
    dividend = -100;
    divisor = -5;
    #10;
	 
	 dividend = -8;
	 divisor = -4;
	 #10
	 
	 dividend = -99;
	 divisor = -5;
	 #10

    // Test case 5: Large numbers
    dividend = 32'h7FFFFFFF; // Max positive value for a signed integer
    divisor = 2;
    #10;

    // Add more test cases as needed

    // End of simulation
  end

  // Optional: Monitor changes
  initial begin
    $monitor("Time = %t, error = %b, dividend = %d, divisor = %d, remainder = %h, quotient = %h",
             $time, error, dividend, divisor, remainder, quotient);
  end

endmodule
