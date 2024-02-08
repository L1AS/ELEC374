module Bus (
    // Mux
    input [31:0]BusMuxInRZ, input [31:0]BusMuxInRA, input [31:0]BusMuxInRB,
    // Encoder
    input RZout, RAout, RBout,

    output wire [31:0]BusMuxOut

);

reg [31:0]q;

always @ (*) begin
    if(RZout) q = BusMuxInRZ;
    if(RAout) q = BusMuxInRA;
    if(RBout) q = BusMuxInRB;
end
assign BusMuxOut = q;
endmodule