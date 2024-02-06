`timescale 1ns / 10ps

module mul_op_tb;
    reg [31:0] multiplicand, multiplier; // 32-bit inputs for multiplication
    wire [63:0] product; // 64-bit output for the product
    reg Clock; // Clock signal for synchronization

    // Instantiate the mul_op module
    mul_op DUT (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    // Clock generation
    initial begin
        Clock = 0;
        forever #10 Clock = ~Clock;
    end

    // Test sequence
    initial begin
        // Test case 1
        multiplicand = 32'd3; // Example multiplicand
        multiplier = 32'd4; // Example multiplier
        #20; // Wait for operation to complete

        // Add more test cases as needed

        // Finish simulation
        #100;
        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time: %g, multiplicand: %d, multiplier: %d, product: %d", $time, multiplicand, multiplier, product);
    end
endmodule
