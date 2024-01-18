module Bus (
    Mux
    input [7:0]BusMuxInRZ, input [7:0]BusMuInRA, input [7:0]BusMuxInRB,
    //Encoder
    input RZout, RAout, RBout,

    output wire [7:0]BusMuxOut

);

reg [7:0]q;

always 0 (*) begin
    if(RZout) q = BusMuxInRZ;
    if(RAout) q = BusMuxInRA;
    if(RBout) q = BusMuxInRB;
end
asign BusMuxOut = q;
endmodule