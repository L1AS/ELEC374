module decoder_4_to_16 (
    output [15:0] decodedOutput,
    input  [3:0] decoderInput
);

    reg [15:0] decoded_value;

    always @ (decoderInput) begin
        case(decoderInput)
            4'b0000: decoded_value = 16'h0001; // R0
            4'b0001: decoded_value = 16'h0002; // R1
            4'b0010: decoded_value = 16'h0004; // R2
            4'b0011: decoded_value = 16'h0008; // R3
            4'b0100: decoded_value = 16'h0010; // R4
            4'b0101: decoded_value = 16'h0020; // R5
            4'b0110: decoded_value = 16'h0040; // R6
            4'b0111: decoded_value = 16'h0080; // R7
            4'b1000: decoded_value = 16'h0200; // R9
            4'b1001: decoded_value = 16'h0400; // R10
            4'b1010: decoded_value = 16'h0800; // R11
            4'b1011: decoded_value = 16'h1000; // R12
            4'b1100: decoded_value = 16'h2000; // R13
            4'b1101: decoded_value = 16'h4000; // R14
            4'b1110: decoded_value = 16'h8000; // R15
			default: decoded_value = 16'h0;
        endcase
    end
    
    assign decodedOutput = decoded_value;
endmodule