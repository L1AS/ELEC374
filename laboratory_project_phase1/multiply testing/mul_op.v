module mul_op(
    input clk,
    input [31:0] multiplicand,
    input [31:0] multiplier,
    output reg [63:0] product,
    input start,
    output reg done
);

reg [64:0] prod; // Include an extra bit for Booth's algorithm
reg [31:0] mcand;
reg [5:0] i; // Counter to manage the iteration process

always @(posedge clk) begin
    if (start) begin
        prod <= {33'b0, multiplier, 1'b0}; // Initialize with multiplier and extra bit
        mcand <= multiplicand;
        i <= 0;
        done <= 0;
    end
    else if (i < 64) begin // Adjust the condition to match your iteration needs
        case (prod[i:i+2]) // Adjust slice according to Booth's algorithm
            // Your case statements here
            // Update prod based on the case
        endcase
        prod <= prod >> 2; // Shift right by 2 positions
        i <= i + 2; // Increment counter by 2 to move to the next bits
        done <= (i >= 62) ? 1'b1 : 1'b0; // Indicate completion
    end
end

always @(posedge clk) begin
    if (done) begin
        product <= prod[63:0]; // Assign the final product once done
    end
end

endmodule
