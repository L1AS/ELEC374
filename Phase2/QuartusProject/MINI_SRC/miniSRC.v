module miniSRC{
    output[0:31] outPortData,               // output.
    input[0:31] inPortDataIn,               // input.
    input clock, clear,                     // control signals.
          Gra, Grb, Grc, Rin, Rout, BAout,  // control signals for IR
          PCout, IncPC, PCin, IRin,          // PC and IR signals.
          Yin, Hiout, Hiin, LOout, LOin,    // datapath MUX signals.
          Cout, Zhighout, Zlowout, Zin,     //
          MDRout, MDRin, MARin,             // Mem Data Interface signals.
          memRead, memWrite,                // memory read enable and write enable signals.
          outPortEN, outPortEN,             // Input/Output signals.
    input[0:4] opcode
}
    
    // csigned extended
    // consult Figure 4 in the phase 2 instruction
    wire[0:31] cSignExtended;
    assign cSignExtended = {{14{IRout[18]}}, IRout[17:0]};
    //IR Decode
    select_encode ir_encode_select(reg_in, reg_out, Gra, Grb, Grc, 
                                    Rin, Rout, BAout, IRout);

    // memory
    memory RAM (.address(MARdata[8:0]), 
				.clock(clock), 
				.data(busMuxInMDR), 
				.rden(memRead), 
				.wren(memWrite), 
				.q(Mdatain)
               );

    register_gen PC (busMuxInPC, clear, clock, PCin, busMuxOut);
    register_gen IR (IRout, clear, clock, IRin, busMuxInMDR);
    

    // RAM interface
    register_gen MAR (MARdata, clear, clock, MARin, busMuxOut);
    mux_2_to_1 MDRMux (MDRMuxOut, busMuxOut, Mdatain, memRead);
    register_gen MDR (busMuxInMDR, clear, clock, MDRin, MDRMuxOut);

    Datapath DUT (
            outPortData, busMuxOut          // outputs
            inPortDataIn,                   // inputs
            clock, clear,                   // control signals  
            Yin, Hiout, Hiin, LOout, LOin,  // Data Path Signals
            Zhighout, Zlowout, Zin,         //
            PCout, IncPC, busMuxInPC,       // PC signals
            MDRout, busMuxInMDR,            // Memory data interface signal
            inPortEN, outPortEN,            // input/output
            Cout, cSignExtended,             // imediate value signals   
            opcode                          // ALU opcode
    );

endmodule