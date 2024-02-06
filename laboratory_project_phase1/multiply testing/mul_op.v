module mul_op(
    input [31:0] multiplicand,
    input [31:0] multiplier,
    output [63:0] product
);

reg [63:0] prod;  // Corrected size to 64 bits for the entire product
reg [31:0] mcand; // Temporary register for multiplicand
integer i;

always @(multiplicand or multiplier) begin
    prod = {32'b0, multiplier}; // Initialize product register with multiplier, no need for extra bit
    mcand = multiplicand;

    for (i = 0; i < 32; i = i + 2) begin
        case (prod[i+:3]) // Ensure this slice captures the correct bits including the LSB extension
            3'b001, 3'b010: prod[63:32] = prod[63:32] + mcand;
            3'b011: prod[63:32] = prod[63:32] + {mcand, 1'b0}; // mcand shifted left (x2)
            3'b100: prod[63:32] = prod[63:32] - {mcand, 1'b0}; // Subtract mcand shifted left (x2)
            3'b101, 3'b110: prod[63:32] = prod[63:32] - mcand;
            default: ; // 3'b000 and 3'b111 do nothing
        endcase
        prod = {prod[63], prod[63:1]}; // Corrected shift right by 2 positions, maintaining sign bit if needed
    end
end

assign product = prod; // Directly assign the 64-bit product

endmodule
