// 32:1 Multiplexer to be used bus 

module mux_32_to_1 (
	// General purpose registers
	input wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, 
                    BusMuxInR5, BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, 
                    BusMuxInR10, BusMuxInR11, BusMuxInR12, BusMuxInR13, BusMuxInR14, 
                    BusMuxInR15, BusMuxInHI, BusMuxInLO, BusMuxInZhigh, BusMuxInZlow, 
                    BusMuxInPC, BusMuxInMDR, BusMuxInInPort, Csignextended,
	// Multiplexer's output that feeds to the bus
	output reg [31:0] BusMuxOut,
	// Select signal for the multiplexer
	input wire [4:0] BusMuxSignal
);

always@(*) begin
	// Assign the appropriate input signal to the multiplexer's output
	case(BusMuxSignal)
    5'b00000: BusMuxOut <= BusMuxInR0[31:0];
    5'b00001: BusMuxOut <= BusMuxInR1[31:0];
    5'b00010: BusMuxOut <= BusMuxInR2[31:0];
    5'b00011: BusMuxOut <= BusMuxInR3[31:0];
    5'b00100: BusMuxOut <= BusMuxInR4[31:0];
    5'b00101: BusMuxOut <= BusMuxInR5[31:0];
    5'b00110: BusMuxOut <= BusMuxInR6[31:0];
    5'b00111: BusMuxOut <= BusMuxInR7[31:0];
    5'b01000: BusMuxOut <= BusMuxInR8[31:0];
    5'b01001: BusMuxOut <= BusMuxInR9[31:0];
    5'b01010: BusMuxOut <= BusMuxInR10[31:0];
    5'b01011: BusMuxOut <= BusMuxInR11[31:0];
    5'b01100: BusMuxOut <= BusMuxInR12[31:0];
    5'b01101: BusMuxOut <= BusMuxInR13[31:0];
    5'b01110: BusMuxOut <= BusMuxInR14[31:0];
    5'b01111: BusMuxOut <= BusMuxInR15[31:0];
    5'b10000: BusMuxOut <= BusMuxInHI[31:0];
    5'b10001: BusMuxOut <= BusMuxInLO[31:0];
    5'd10010: BusMuxOut <= BusMuxInZhigh[31:0];
    5'd10011: BusMuxOut <= BusMuxInZlow[31:0];
    5'd10100: BusMuxOut <= BusMuxInPC[31:0];
    5'd10101: BusMuxOut <= BusMuxInMDR[31:0];
    5'd10110: BusMuxOut <= BusMuxInInPort[31:0];
    5'd10111: BusMuxOut <= Csignextended[31:0];
	  default: BusMuxOut <= 32'd0;
  endcase
end
	
endmodule