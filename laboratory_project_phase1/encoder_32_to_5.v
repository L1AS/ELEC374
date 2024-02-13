// 32-to-5 Encoder for the bus 

module encoder_32_to_5 (
  input wire [31:0] encoderInput,
  output reg [4:0] encodedOutput
);

  integer  i;
  reg found;

  always@(*) begin
    // Encode the input data
      encodedOutput = 5'b0;
		found = 1'b1;
    for (i = 31; i >= 0 && found; i = i - 1) begin
      if (encoderInput[i] == 1'b1) begin
        encodedOutput = i[4:0];
        found = 1'b0;
      end
    end
  end
endmodule