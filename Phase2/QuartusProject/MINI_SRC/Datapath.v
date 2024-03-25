module Datapath (
    output [31:0] outPortData, busMuxOut,    // outputs 
    input [31:0] inPortDataIn,               // inputs
    input clock, clear,                     	// control signals  
          Yin, HIout, HIin, LOout, LOin,    	// Data Path Signals
          Zhighout, Zlowout, Zin,           	//
          PCout_en, IncPC,                      	// PC signals
    input [31:0] busMuxInPC,                  // PC data
    input MDRout, inPortOut,
	  input[31:0] busMuxInMDR,  					// Memory data interface signal
    input inPort_en, outPort_en,              	// input/output
    input Cout, 										// imediate value signals
	  input[31:0] cSignExtended,      			//
    input[4:0] opcode,                       // ALU opcode
    input[15:0] reg_in, reg_out,       // register control signals
    input BAout, jal_R15
);

  wire [31:0] busMuxInR0, 
              busMuxInR1, 
              busMuxInR2, 
              busMuxInR3, 
              busMuxInR4, 
              busMuxInR5, 
              busMuxInR6, 
              busMuxInR7, 
              busMuxInR8, 
              busMuxInR9, 
              busMuxInR10, 
              busMuxInR11, 
              busMuxInR12, 
              busMuxInR13, 
              busMuxInR14, 
              busMuxInR15, 
              busMuxInHI, 
              busMuxInLO, 
              busMuxInZhigh, 
              busMuxInZlow, 
              Yout,
              busMuxInInport,
              intermediateR0;
  wire [4:0] busMuxSignal;
  wire r15_en;
  assign r15_en <= reg_in[15] | jal_R15;
  wire [63:0] alu_out;

	  
  // registers
  register_gen R0 (intermediateR0, clear, clock, reg_in[0], busMuxOut);
  assign busMuxInR0 = ~(BAout) & intermediateR0; // assert zero to R0

  register_gen R1 (busMuxInR1, clear, clock, reg_in[1], busMuxOut);
  register_gen R2 (busMuxInR2, clear, clock, reg_in[2], busMuxOut);
  register_gen R3 (busMuxInR3, clear, clock, reg_in[3], busMuxOut);
  register_gen R4 (busMuxInR4, clear, clock, reg_in[4], busMuxOut);
  register_gen R5 (busMuxInR5, clear, clock, reg_in[5], busMuxOut);
  register_gen R6 (busMuxInR6, clear, clock, reg_in[6], busMuxOut);
  register_gen R7 (busMuxInR7, clear, clock, reg_in[7], busMuxOut);
  register_gen R8 (busMuxInR8, clear, clock, reg_in[8], busMuxOut);
  register_gen R9 (busMuxInR9, clear, clock, reg_in[9], busMuxOut);
  register_gen R10 (busMuxInR10, clear, clock, reg_in[10], busMuxOut);
  register_gen R11 (busMuxInR11, clear, clock, reg_in[11], busMuxOut);
  register_gen R12 (busMuxInR12, clear, clock, reg_in[12], busMuxOut);
  register_gen R13 (busMuxInR13, clear, clock, reg_in[13], busMuxOut);
  register_gen R14 (busMuxInR14, clear, clock, reg_in[14], busMuxOut);

  wire r15_en;
  assign r15_en <= reg_in[15] | jal_R15;
  register_gen R15 (busMuxInR15, clear, clock, r15_en, busMuxOut);    // 

  register_gen HI (busMuxInHI, clear, clock, HIin, busMuxOut);
  register_gen LO (busMuxInLO, clear, clock, LOin, busMuxOut);

  register_gen RY (Yout, clear, clock, Yin, busMuxOut);
  register_gen Zhigh (busMuxInZhigh, clear, clock, Zin, alu_out[63:32]);
  register_gen Zlow (busMuxInZlow, clear, clock, Zin, alu_out[31:0]);
  // Input, Output Ports
  register_gen In_Port (busMuxInInport, clear, clock, inPort_en, inPortDataIn);
  register_gen Out_port (outPortData, clear, clock, outPort_en, busMuxOut);

  // Bus
  encoder_32_to_5 BusEncoder (
    busMuxSignal, 
    {8'b0, Cout, inPortOut, MDRout, PCout_en, Zlowout, Zhighout, LOout, HIout, 
     reg_out}
  );

  mux_32_to_1 busMux (
    busMuxOut,
    busMuxInR0, busMuxInR1, busMuxInR2, busMuxInR3, busMuxInR4, busMuxInR5, 
    busMuxInR6, busMuxInR7, busMuxInR8, busMuxInR9, busMuxInR10, busMuxInR11, 
    busMuxInR12, busMuxInR13, busMuxInR14, busMuxInR15, busMuxInHI, busMuxInLO, 
    busMuxInZhigh, busMuxInZlow, busMuxInPC, busMuxInMDR, 
    busMuxInInport, cSignExtended, busMuxSignal
  );

  // ALU
  alu ALU (alu_out, IncPC, Yout, busMuxOut, opcode);

endmodule