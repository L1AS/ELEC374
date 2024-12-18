module Datapath (
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
<<<<<<< HEAD
             IncPC, Cout, IRin, Yin,
=======
             IncPC, inPortOut, Cout, IRin, Yin,
>>>>>>> main
             Read,
             input[31:0] Mdatain,
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
<<<<<<< HEAD
              BusMuxInMDR,  
              Csignextended,
              BusMuxInY,
              BusMuxInIR,
              BusMuxInMAR;


  wire [31:0] BusMuxOut;
  wire [4:0] BusMuxSignal;
  wire [31:0] MDRMuxOut;
  wire [63:0] alu_out;

  // registers
  register_gen R0 (clear, clock, R0in, BusMuxOut, BusMuxInR0);
  register_gen R1 (clear, clock, R1in, BusMuxOut, BusMuxInR1);
  register_gen R2 (clear, clock, R2in, BusMuxOut, BusMuxInR2);
  register_gen R3 (clear, clock, R3in, BusMuxOut, BusMuxInR3);
  register_gen R4 (clear, clock, R4in, BusMuxOut, BusMuxInR4);
  register_gen R5 (clear, clock, R5in, BusMuxOut, BusMuxInR5);
  register_gen R6 (clear, clock, R6in, BusMuxOut, BusMuxInR6);
  register_gen R7 (clear, clock, R7in, BusMuxOut, BusMuxInR7);
  register_gen R8 (clear, clock, R8in, BusMuxOut, BusMuxInR8);
  register_gen R9 (clear, clock, R9in, BusMuxOut, BusMuxInR9);
  register_gen R10 (clear, clock, R10in, BusMuxOut, BusMuxInR10);
  register_gen R11 (clear, clock, R11in, BusMuxOut, BusMuxInR11);
  register_gen R12 (clear, clock, R12in, BusMuxOut, BusMuxInR12);
  register_gen R13 (clear, clock, R13in, BusMuxOut, BusMuxInR13);
  register_gen R14 (clear, clock, R14in, BusMuxOut, BusMuxInR14);
  register_gen R15 (clear, clock, R15in, BusMuxOut, BusMuxInR15);

  register_gen HI (clear, clock, HIin, BusMuxOut, BusMuxInHI);
  register_gen LO (clear, clock, LOin, BusMuxOut, BusMuxInLO);

  register_gen RY (clear, clock, Yin, BusMuxOut, BusMuxInY);
  register_gen Zhigh (clear, clock, Zin, alu_out[63:32], BusMuxInZhigh);
  register_gen Zlow (clear, clock, Zin, alu_out[31:0], BusMuxInZlow);

  register_gen PC (clear, clock, PCin, BusMuxOut, BusMuxInPC);
  register_gen IR (clear, clock, IRin, BusMuxOut, BusMuxInIR);

  register_gen MAR (clear, clock, MARin, BusMuxOut, BusMuxInMAR);

  // MDR
  mux_2_to_1 MDRMux (BusMuxOut, Mdatain, Read, MDRMuxOut);
  register_gen MDR (clear, clock, MDRin, MDRMuxOut, BusMuxInMDR);

  // Bus
  encoder_32_to_5 BusEncoder (
    { 9'b0, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, 
      R9out, R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, 
      Zhighout, Zlowout, PCout, MDRout, Cout}, BusMuxSignal
  );

  mux_32_to_1 BusMux (
=======
              BusMuxInMDR,
              Csignextended,
              Yout,
              IRout,
              BusMuxInMAR,
              BusMuxOut,
              MDRMuxOut,
				      BusMuxInInport;
  wire [4:0] BusMuxSignal;
  wire [63:0] alu_out;

  // registers
  register_gen R0 (BusMuxInR0, clear, clock, R0in, BusMuxOut);
  register_gen R1 (BusMuxInR1, clear, clock, R1in, BusMuxOut);
  register_gen R2 (BusMuxInR2, clear, clock, R2in, BusMuxOut);
  register_gen R3 (BusMuxInR3, clear, clock, R3in, BusMuxOut);
  register_gen R4 (BusMuxInR4, clear, clock, R4in, BusMuxOut);
  register_gen R5 (BusMuxInR5, clear, clock, R5in, BusMuxOut);
  register_gen R6 (BusMuxInR6, clear, clock, R6in, BusMuxOut);
  register_gen R7 (BusMuxInR7, clear, clock, R7in, BusMuxOut);
  register_gen R8 (BusMuxInR8, clear, clock, R8in, BusMuxOut);
  register_gen R9 (BusMuxInR9, clear, clock, R9in, BusMuxOut);
  register_gen R10 (BusMuxInR10, clear, clock, R10in, BusMuxOut);
  register_gen R11 (BusMuxInR11, clear, clock, R11in, BusMuxOut);
  register_gen R12 (BusMuxInR12, clear, clock, R12in, BusMuxOut);
  register_gen R13 (BusMuxInR13, clear, clock, R13in, BusMuxOut);
  register_gen R14 (BusMuxInR14, clear, clock, R14in, BusMuxOut);
  register_gen R15 (BusMuxInR15, clear, clock, R15in, BusMuxOut);

  register_gen HI (BusMuxInHI, clear, clock, HIin, BusMuxOut);
  register_gen LO (BusMuxInLO, clear, clock, LOin, BusMuxOut);

  register_gen RY (Yout, clear, clock, Yin, BusMuxOut);
  register_gen Zhigh (BusMuxInZhigh, clear, clock, Zin, alu_out[63:32]);
  register_gen Zlow (BusMuxInZlow, clear, clock, Zin, alu_out[31:0]);

  register_gen PC (BusMuxInPC, clear, clock, PCin, BusMuxOut);
  register_gen IR (IRout, clear, clock, IRin, BusMuxOut);

  // RAM interface
  register_gen MAR (BusMuxInMAR, clear, clock, MARin, BusMuxOut);
  mux_2_to_1 MDRMux (MDRMuxOut, BusMuxOut, Mdatain, Read);
  register_gen MDR (BusMuxInMDR, clear, clock, MDRin, MDRMuxOut);

  // Bus
  encoder_32_to_5 BusEncoder (
    BusMuxSignal, 
    {8'b0, Cout, inPortOut, MDRout, PCout, Zlowout, Zhighout, LOout, HIout, 
     R15out, R14out, R13out, R12out, R11out, R10out, R9out, R8out, R7out, R6out, 
     R5out, R4out, R3out, R2out, R1out, R0out}
  );

  mux_32_to_1 BusMux (
    BusMuxOut,
>>>>>>> main
    BusMuxInR0, BusMuxInR1, BusMuxInR2, BusMuxInR3, BusMuxInR4, BusMuxInR5, 
    BusMuxInR6, BusMuxInR7, BusMuxInR8, BusMuxInR9, BusMuxInR10, BusMuxInR11, 
    BusMuxInR12, BusMuxInR13, BusMuxInR14, BusMuxInR15, BusMuxInHI, BusMuxInLO, 
    BusMuxInZhigh, BusMuxInZlow, BusMuxInPC, BusMuxInMDR, 
<<<<<<< HEAD
    Csignextended, BusMuxOut, BusMuxSignal
  );

  // ALU
  alu ALU (
    .clear(clear), .clock(clock), .IncPC(IncPC), .A_reg(BusMuxInY), .B_reg(BusMuxOut), 
    .opcode(opcode), .out_result(alu_out)
  );
=======
    Csignextended, BusMuxInInport, BusMuxSignal
  );

  // ALU
  alu ALU (alu_out, IncPC, Yout, BusMuxOut, opcode);
>>>>>>> main

endmodule