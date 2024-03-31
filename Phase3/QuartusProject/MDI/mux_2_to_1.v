// 32:1 Multiplexer to be used by MDR

module mux_2_to_1 (
  output reg [31:0] out,
  input wire [31:0] busMuxOut, Mdatain, 
  input wire read
);
 
always@(*) begin
  if (read) begin
    out <= Mdatain[31:0];
  end
  else begin
    out <= busMuxOut[31:0];
  end
end
 
endmodule