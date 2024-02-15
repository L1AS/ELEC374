// 32-to-5 Encoder for the bus 
module encoder_32_to_5 (
  input wire [31:0] encoderInput,
  output [4:0] encodedOutput
);
    reg [4:0] encoded_value;

    always @* begin
      case (1'b1) // Synthesize as a priority encoder with the first match encoderInput the case statement
        encoderInput[0]: encoded_value = 5'b00000; // R0
        encoderInput[1]: encoded_value = 5'b00001; // R1
        encoderInput[2]: encoded_value = 5'b00010; // R2
        encoderInput[3]: encoded_value = 5'b00011; // R3
        encoderInput[4]: encoded_value = 5'b00100; // R4
        encoderInput[5]: encoded_value = 5'b00101; // R5
        encoderInput[6]: encoded_value = 5'b00110; // R6
        encoderInput[7]: encoded_value = 5'b00111; // R7
        encoderInput[8]: encoded_value = 5'b01000; // R8
        encoderInput[9]: encoded_value = 5'b01001; // R9
        encoderInput[10]: encoded_value = 5'b01010; // R10
        encoderInput[11]: encoded_value = 5'b01011; // R11
        encoderInput[12]: encoded_value = 5'b01100; // R12
        encoderInput[13]: encoded_value = 5'b01101; // R13
        encoderInput[14]: encoded_value = 5'b01110; // R14
        encoderInput[15]: encoded_value = 5'b01111; // R15
        encoderInput[16]: encoded_value = 5'b10000; // HI
        encoderInput[17]: encoded_value = 5'b10001; // LO
        encoderInput[18]: encoded_value = 5'b10010; // Zhigh
        encoderInput[19]: encoded_value = 5'b10011; // Zlow
        encoderInput[20]: encoded_value = 5'b10100; // PC
        encoderInput[21]: encoded_value = 5'b10101; // MDR
        encoderInput[22]: encoded_value = 5'b10110; // inPortOut
        encoderInput[23]: encoded_value = 5'b10111; // Cout
        encoderInput[24]: encoded_value = 5'b1;     //undefined
        encoderInput[25]: encoded_value = 5'b1;     //undefined
        encoderInput[26]: encoded_value = 5'b1;     //undefined
        encoderInput[26]: encoded_value = 5'b1;     //undefined
        encoderInput[27]: encoded_value = 5'b1;     //undefined
        encoderInput[28]: encoded_value = 5'b1;     //undefined
        encoderInput[20]: encoded_value = 5'b1;     //undefined
        encoderInput[31]: encoded_value = 5'b1;     //undefined    
        default: encoded_value= 5'd31; // Default case if none of the encoderInputs are high
      endcase
    end

    assign encodedOutput = encoded_value;
endmodule