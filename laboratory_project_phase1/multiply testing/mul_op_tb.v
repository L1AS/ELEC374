`timescale 1ns / 10ps

module mul_op_tb;
    reg [31:0] multiplicand, multiplier; // 32-bit inputs for multiplication
    wire [63:0] product; // 64-bit output for the product
    reg Clock; // Clock signal for synchronization

    // State definitions
    parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, 
              Reg_load2a = 4'b0011, Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, 
              Reg_load3b = 4'b0110, T0 = 4'b0111, T1 = 4'b1000, T2 = 4'b1001, 
              T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;
    
    reg [3:0] Present_state = Default;

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

    // State transitions
    always @(posedge Clock) begin
        case (Present_state)
            Default: Present_state = Reg_load1a;
            Reg_load1a: Present_state = Reg_load1b;
            Reg_load1b: Present_state = Reg_load2a;
            Reg_load2a: Present_state = Reg_load2b;
            Reg_load2b: Present_state = Reg_load3a;
            Reg_load3a: Present_state = Reg_load3b;
            Reg_load3b: Present_state = T0;
            T0: Present_state = T1;
            T1: Present_state = T2;
            T2: Present_state = T3;
            T3: Present_state = T4;
            T4: Present_state = T5;
            T5: ; // No next state defined for T5, assuming end of test or loop back to another state
        endcase
    end

    // Test sequence
    always @(Present_state) begin
        case (Present_state)
            Default: begin
                // Test case 1
                multiplicand = 32'd0; // Example multiplicand
                multiplier = 32'd0; // Example multiplier
                #20; // Wait for operation to complete
            end
            T0: begin
                multiplicand = 32'd1;
                multiplier = 32'd1;
                #20
        // Add more test cases as needed

        // Finish simulation

    end

    // // Monitor changes
    // initial begin
    //     $monitor("Time: %g, multiplicand: %d, multiplier: %d, product: %d", $time, multiplicand, multiplier, product);
    // end
endmodule
