module decoder_4_to_16 (
    output [15:0] decodedOutput,
    input  [31:0] decoderInput
);

    reg [15:0] decoded_value;

    always @ (decoderInput) begin
        case(1'b1)
            decoderInput[0]: decoded_value = 16'h0001; // R0
            decoderInput[1]: decoded_value = 16'h0002; // R1
            decoderInput[2]: decoded_value = 16'h0004; // R2
            decoderInput[3]: decoded_value = 16'h0008; // R3
            decoderInput[4]: decoded_value = 16'h0010; // R4
            decoderInput[5]: decoded_value = 16'h0020; // R5
            decoderInput[6]: decoded_value = 16'h0040; // R6
            decoderInput[7]: decoded_value = 16'h0080; // R7
            decoderInput[8]: decoded_value = 16'h0100; // R8
            decoderInput[9]: decoded_value = 16'h0200; // R9
            decoderInput[10]: decoded_value = 16'h0400; // R10
            decoderInput[11]: decoded_value = 16'h0800; // R11
            decoderInput[12]: decoded_value = 16'h1000; // R12
            decoderInput[13]: decoded_value = 16'h2000; // R13
            decoderInput[14]: decoded_value = 16'h4000; // R14
            decoderInput[15]: decoded_value = 16'h8000; // R15
				default: decoded_value = 16'h0;
        endcase
    end
    
    assign decodedOutput = decoded_value;
endmodule