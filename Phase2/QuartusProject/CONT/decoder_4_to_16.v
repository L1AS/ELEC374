module decoder_4_to_16 (
    output [15:0] decodedOutput;
    input wire [31:0] decoderInput;
);

    reg [15:0] decoded_value;

    always @ (*) begin
        case(1'b1)
            encoderInput[0]: decoded_value = 16'h0001; // R0
            encoderInput[1]: decoded_value = 16'h0002; // R1
            encoderInput[2]: decoded_value = 16'h0004; // R2
            encoderInput[3]: decoded_value = 16'h0008; // R3
            encoderInput[4]: decoded_value = 16'h0010; // R4
            encoderInput[5]: decoded_value = 16'h0020; // R5
            encoderInput[6]: decoded_value = 16'h0040; // R6
            encoderInput[7]: decoded_value = 16'h0080; // R7
            encoderInput[8]: decoded_value = 16'h0100; // R8
            encoderInput[9]: decoded_value = 16'h0200; // R9
            encoderInput[10]: decoded_value = 16'h0400; // R10
            encoderInput[11]: decoded_value = 16'h0800; // R11
            encoderInput[12]: decoded_value = 16'h1000; // R12
            encoderInput[13]: decoded_value = 16'h2000; // R13
            encoderInput[14]: decoded_value = 16'h4000; // R14
            encoderInput[15]: decoded_value = 16'h8000; // R15
        endcase
    end
    
    assign decodedOutput = decoded_value;
endmodule