`timescale 1ns / 10ps

module mul_op_tb;
    reg signed [31:0] a, b;
    wire [63:0] z;

    // Instantiate the mul_op module
    mul_op DUT (
        .a(a),
        .b(b),
        .z(z)
    );

    // Clock signal for synchronization (if needed)
    reg Clock;
    initial begin
        Clock = 0;
        forever #10 Clock = ~Clock;
    end

    // Test sequence
    initial begin
        // Initialize inputs
        a = 32'sd0;
        b = 32'sd0;
        #20;

        // Test case 1
        a = 32'sd2;
        b = 32'sd3;
        #20;

        // Test case 2
        a = -32'sd4;
        b = 32'sd5;
        #20;

        // Add more test cases as needed
        // ...

        // End simulation
        
    end

    // Monitor changes
    initial begin
        $monitor("At time %t, a = %d, b = %d, z = %d", $time, a, b, z);
    end
endmodule
