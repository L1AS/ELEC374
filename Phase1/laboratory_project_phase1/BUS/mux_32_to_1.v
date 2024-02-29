// 32:1 Multiplexer to be used bus 

module mux_32_to_1 (
	// Multiplexer's output that feeds to the bus
	output reg [31:0] BusMuxOut,
	// General purpose registers
	input wire [31:0] BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, 
                    BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, 
                    BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO,
                    BusMuxInZhigh, BusMuxInZlow, BusMuxInPC, BusMuxInMDR, 
                    BusMuxInInport, Csignextended,
	// Select signal for the multiplexer
	input wire [4:0] BusMuxSignal
);

always@(*) begin
	// Assign the appropriate input signal to the multiplexer's output
	case(BusMuxSignal)
    5'b00000: BusMuxOut <= BusMuxInR0;
    5'b00001: BusMuxOut <= BusMuxInR1;
    5'b00010: BusMuxOut <= BusMuxInR2;
    5'b00011: BusMuxOut <= BusMuxInR3;
    5'b00100: BusMuxOut <= BusMuxInR4;
    5'b00101: BusMuxOut <= BusMuxInR5;
    5'b00110: BusMuxOut <= BusMuxInR6;
    5'b00111: BusMuxOut <= BusMuxInR7;
    5'b01000: BusMuxOut <= BusMuxInR8;
    5'b01001: BusMuxOut <= BusMuxInR9;
    5'b01010: BusMuxOut <= BusMuxInR10;
    5'b01011: BusMuxOut <= BusMuxInR11;
    5'b01100: BusMuxOut <= BusMuxInR12;
    5'b01101: BusMuxOut <= BusMuxInR13;
    5'b01110: BusMuxOut <= BusMuxInR14;
    5'b01111: BusMuxOut <= BusMuxInR15;
    5'b10000: BusMuxOut <= BusMuxInHI;
    5'b10001: BusMuxOut <= BusMuxInLO;
    5'b10010: BusMuxOut <= BusMuxInZhigh;
    5'b10011: BusMuxOut <= BusMuxInZlow;
    5'b10100: BusMuxOut <= BusMuxInPC;
    5'b10101: BusMuxOut <= BusMuxInMDR;
    5'b10110: BusMuxOut <= BusMuxInInport;
    5'b10111: BusMuxOut <= Csignextended;
	  default: BusMuxOut <= 32'd0;
  endcase
end
	
endmodule