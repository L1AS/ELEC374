module DataPath (
  input wire clock, clear,
  input wire R0out, R0in,
             R1out, R1in,
             R2out, R2in,
             R3out, R3in,
             R4out, R4in,
             R5out, R5in,
             R6out, R6in,
             R7out, R7in,
             R8out, R8in,
             R9out, R9in,
             R10out, R10in,
             R11out, R11in,
             R12out, R12in,
             R13out, R13in,
             R14out, R14in,
             R15out, R15in, 
             HIout, HIin,
             LOout, LOin,
             PCout, PCin, 
             Zhighout, Zlowout, Zin,
             MDRout, MDRin, MARin,
             InPortout, Cout, IRin, Yin
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
              BusMuxInInPort, 
              Csignextended;
  wire [31:0] BusMuxOut;
  wire [4:0] BusMuxSignal;
  wire [31:0] MDRMuxOut;
  wire Read;

  // registers
  register_32_bit R0 (clear, clock, R0in, BusMuxOut, BusMuxInR0);
  register_32_bit R1 (clear, clock, R1in, BusMuxOut, BusMuxInR1);
  register_32_bit R2 (clear, clock, R2in, BusMuxOut, BusMuxInR2);
  register_32_bit R3 (clear, clock, R3in, BusMuxOut, BusMuxInR3);
  register_32_bit R4 (clear, clock, R4in, BusMuxOut, BusMuxInR4);
  register_32_bit R5 (clear, clock, R5in, BusMuxOut, BusMuxInR5);
  register_32_bit R6 (clear, clock, R6in, BusMuxOut, BusMuxInR6);
  register_32_bit R7 (clear, clock, R7in, BusMuxOut, BusMuxInR7);
  register_32_bit R8 (clear, clock, R8in, BusMuxOut, BusMuxInR8);
  register_32_bit R9 (clear, clock, R9in, BusMuxOut, BusMuxInR9);
  register_32_bit R10 (clear, clock, R10in, BusMuxOut, BusMuxInR10);
  register_32_bit R11 (clear, clock, R11in, BusMuxOut, BusMuxInR11);
  register_32_bit R12 (clear, clock, R12in, BusMuxOut, BusMuxInR12);
  register_32_bit R13 (clear, clock, R13in, BusMuxOut, BusMuxInR13);
  register_32_bit R14 (clear, clock, R14in, BusMuxOut, BusMuxInR14);
  register_32_bit R15 (clear, clock, R15in, BusMuxOut, BusMuxInR15);

  register_32_bit HI (clear, clock, HIin, BusMuxOut, BusMuxInHI);
  register_32_bit LO (clear, clock, LOin, BusMuxOut, BusMuxInLO);

  register_32_bit Y (clear, clock, Yin, BusMuxOut, BusMuxInY);
  register_32_bit Zhigh (clear, clock, Zin, ALUOut[63:32], BusMuxInZhigh);
  register_32_bit Zlow (clear, clock, Zin, ALUOut[31:0], BusMuxInZlow);

  register_32_bit PC (clear, clock, PCin, BusMuxOut, BusMuxInPC);
  register_32_bit IR (clear, clock, IRin, BusMuxOut, BusMuxInIR);

  register_32_bit MAR (clear, clock, MARin, BusMuxOut, BusMuxInMAR);

  // MDR
  mux_2_to_1 MDRMux (BusMuxOut, WHATSHOULDBEHERE, Read, MDRMuxOut);
  register_32_bit MDR (clear, clock, MDRin, MDRMuxOut, BusMuxInMDR);

  // Bus
  encoder_32_to_5 BusEncoder (
    { 8'b0, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, 
      R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, 
      Zhighout, Zlowout, PCout, MDRout, InPortout, Cout }, BusMuxSignal
  );

  mux_32_to_1 BusMux (
    BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, 
    BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, 
    BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, 
    BusMuxInZhigh, BusMuxInZlow, BusMuxInPC, BusMuxInMDR, BusMuxInInPort, 
    Csignextended, BusMuxOut, BusMuxSignal
  );

  // ALU
  alu ALU ();

endmodule