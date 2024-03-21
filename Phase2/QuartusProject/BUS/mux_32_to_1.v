// 32:1 Multiplexer to be used bus 

module mux_32_to_1 (
	// Multiplexer's output that feeds to the bus
	output reg [31:0] busMuxOut,
	// General purpose registers
	input wire [31:0] busMuxInR0, busMuxInR1, busMuxInR2, busMuxInR3, busMuxInR4, busMuxInR5, 
                    busMuxInR6, busMuxInR7, busMuxInR8, busMuxInR9, busMuxInR10, busMuxInR11, 
                    busMuxInR12, busMuxInR13, busMuxInR14, busMuxInR15, busMuxInHI, busMuxInLO,
                    busMuxInZhigh, busMuxInZlow, busMuxInPC, busMuxInMDR, 
                    busMuxInInport, cSignExtended,
	// Select signal for the multiplexer
	input wire [4:0] busMuxSignal
);

always@(*) begin
	// Assign the appropriate input signal to the multiplexer's output
	case(busMuxSignal)
    5'b00000: busMuxOut <= busMuxInR0;
    5'b00001: busMuxOut <= busMuxInR1;
    5'b00010: busMuxOut <= busMuxInR2;
    5'b00011: busMuxOut <= busMuxInR3;
    5'b00100: busMuxOut <= busMuxInR4;
    5'b00101: busMuxOut <= busMuxInR5;
    5'b00110: busMuxOut <= busMuxInR6;
    5'b00111: busMuxOut <= busMuxInR7;
    5'b01000: busMuxOut <= busMuxInR8;
    5'b01001: busMuxOut <= busMuxInR9;
    5'b01010: busMuxOut <= busMuxInR10;
    5'b01011: busMuxOut <= busMuxInR11;
    5'b01100: busMuxOut <= busMuxInR12;
    5'b01101: busMuxOut <= busMuxInR13;
    5'b01110: busMuxOut <= busMuxInR14;
    5'b01111: busMuxOut <= busMuxInR15;
    5'b10000: busMuxOut <= busMuxInHI;
    5'b10001: busMuxOut <= busMuxInLO;
    5'b10010: busMuxOut <= busMuxInZhigh;
    5'b10011: busMuxOut <= busMuxInZlow;
    5'b10100: busMuxOut <= busMuxInPC;
    5'b10101: busMuxOut <= busMuxInMDR;
    5'b10110: busMuxOut <= busMuxInInport;
    5'b10111: busMuxOut <= cSignExtended;
	  default: busMuxOut <= 32'd0;
  endcase
end
	
endmodule