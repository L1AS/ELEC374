// 32:1 Multiplexer to be used by MDR

module mux_2_to_1 (
  input wire [31:0] input1, input2, 
  input wire read,
  output reg [31:0] out
);
 
always@(*) begin
  if (read) begin
    out <= input2[31:0];
  end
  else begin
    out <= input1[31:0];
  end
end
 
endmodule