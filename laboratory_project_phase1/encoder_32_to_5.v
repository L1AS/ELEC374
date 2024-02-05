// 32-to-5 Encoder for the bus 

module encoder_32_to_5 (
  input wire [31:0] encoderInput,
  output reg [4:0] encodedOutput
);

always@(*) begin
  // Encode the input data
  for (int i = 31; i >= 0; i = i - 1) begin
    if (encoderInput[i] == 1'b1) begin
      encodedOutput <= 5'b00001 * i;
      break;
    end
  end
end
endmodule