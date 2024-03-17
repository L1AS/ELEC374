module Datapath (
  output [31:0] outport_out,
  input [31:0] inport_in,
  input wire clock, clear, 
  input wire Gra, Grb, Grc, Rin, Rout, BAout, Yin,
             Hiout, Hiin, LOout, LOin, 
             PCout, PCin, IncPC, IRin,
             Zhighout, Zlowout, Zin,
             MDRout, MDRin, MARin, Read,
             InportOut, OutportIn,
             memRead, memWrite, // memory read enable and write enable signals
             input[15:0] Cout,   
             // input[31:0] Mdatain,
             input[4:0] opcode
);

  wire [31:0] BusMuxInR0, 
              BusMuxInR1, 
              BusMuxInR2, 
              BusMuxInR3, 
              BusMuxInR4, 
              BusMuxInR5, 
              BusMuxInR6, 
              BusMuxInR7, 
              BusMuxInR8, 
              BusMuxInR9, 
              BusMuxInR10, 
              BusMuxInR11, 
              BusMuxInR12, 
              BusMuxInR13, 
              BusMuxInR14, 
              BusMuxInR15, 
              BusMuxInHI, 
              BusMuxInLO, 
              BusMuxInZhigh, 
              BusMuxInZlow, 
              BusMuxInPC, 
              BusMuxInMDR,
              Csignextended,
              Yout,
              IRout,
              BusMuxInMAR,
              BusMuxOut,
              MDRMuxOut,
				  BusMuxInInport,
              reg_in,
              reg_out,
              Mdatain;
  wire [4:0] BusMuxSignal;
  wire [63:0] alu_out;

  // csigned extended
  // consult Figure 4 in the phase 2 instruction
  assign Csignextended = {{14{IRout[18]}}, IRout[17:0]};
  //IR Decode
  select_encode ir_encode_select(reg_in, reg_out, Gra, Grb, Grc, Rin,
                                 Rout, BAout, IRout);

  // memory
	memory RAM (.address(BusMuxInMAR[8:0]), 
					.clock(clock), 
					.data(BusMuxInMDR), 
					.rden(memRead), 
					.wren(memWrite), 
					.q(Mdatain));
				  
	  
  // registers
  register_gen R0 (IntermediateR0, clear, clock, reg_in[0], BusMuxOut);
  assign BusMuxInR0 = ~(BAout) & IntermediateR0; // assert zero to R0

  register_gen R1 (BusMuxInR1, clear, clock, reg_in[1], BusMuxOut);
  register_gen R2 (BusMuxInR2, clear, clock, reg_in[2], BusMuxOut);
  register_gen R3 (BusMuxInR3, clear, clock, reg_in[3], BusMuxOut);
  register_gen R4 (BusMuxInR4, clear, clock, reg_in[4], BusMuxOut);
  register_gen R5 (BusMuxInR5, clear, clock, reg_in[5], BusMuxOut);
  register_gen R6 (BusMuxInR6, clear, clock, reg_in[6], BusMuxOut);
  register_gen R7 (BusMuxInR7, clear, clock, reg_in[7], BusMuxOut);
  register_gen R8 (BusMuxInR8, clear, clock, reg_in[8], BusMuxOut);
  register_gen R9 (BusMuxInR9, clear, clock, reg_in[9], BusMuxOut);
  register_gen R10 (BusMuxInR10, clear, clock, reg_in[10], BusMuxOut);
  register_gen R11 (BusMuxInR11, clear, clock, reg_in[11], BusMuxOut);
  register_gen R12 (BusMuxInR12, clear, clock, reg_in[12], BusMuxOut);
  register_gen R13 (BusMuxInR13, clear, clock, reg_in[13], BusMuxOut);
  register_gen R14 (BusMuxInR14, clear, clock, reg_in[14], BusMuxOut);
  register_gen R15 (BusMuxInR15, clear, clock, reg_in[15], BusMuxOut);

  register_gen HI (BusMuxInHI, clear, clock, HIin, BusMuxOut);
  register_gen LO (BusMuxInLO, clear, clock, LOin, BusMuxOut);

  register_gen RY (Yout, clear, clock, Yin, BusMuxOut);
  register_gen Zhigh (BusMuxInZhigh, clear, clock, Zin, alu_out[63:32]);
  register_gen Zlow (BusMuxInZlow, clear, clock, Zin, alu_out[31:0]);

  register_gen PC (BusMuxInPC, clear, clock, PCin, BusMuxOut);
  register_gen IR (IRout, clear, clock, IRin, BusMuxOut);

  // Input, Output Ports
  register_gen In_Port (BusMuxInInport, clear, clock, OutportIn, inport_in);
  register_gen Out_port (outport_out, clear, clock, InportOut, BusMuxOut);

  // RAM interface
  register_gen MAR (BusMuxInMAR, clear, clock, MARin, BusMuxOut);
  mux_2_to_1 MDRMux (MDRMuxOut, BusMuxOut, Mdatain, Read);
  register_gen MDR (BusMuxInMDR, clear, clock, MDRin, MDRMuxOut);

  // Bus
  encoder_32_to_5 BusEncoder (
    BusMuxSignal, 
    {8'b0, Cout, InportOut, MDRout, PCout, Zlowout, Zhighout, LOout, HIout, 
     reg_out}
  );

  mux_32_to_1 BusMux (
    BusMuxOut,
    BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, 
    BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, 
    BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, 
    BusMuxInZhigh, BusMuxInZlow, BusMuxInPC, BusMuxInMDR, 
    Csignextended, BusMuxInInport, BusMuxSignal
  );

  // ALU
  alu ALU (alu_out, IncPC, Yout, BusMuxOut, opcode);

endmodule