module miniSRC(
    output[31:0] outPortData,               // output.
    input[31:0] inPortDataIn,               // input.
    input clock, clear,                     // control signals.
          Gra, Grb, Grc, Rin, Rout, BAout,  // control signals for IR
          PCout_en, IncPC, PC_en, IR_en,          // PC and IR signals.
          Yin, HIout, HIin, LOout, LOin,    // datapath MUX signals.
          Cout, Zhighout, Zlowout, Zin,     //
          MDRout, MDRin, MARin,             // Mem Data Interface signals.
          memRead, memWrite,                // memory read enable and write enable signals.
          inPort_en, outPort_en,             // Input/Output signals.
    input[4:0] opcode
);
    wire done;
	wire[31:0] IRout, MARdata, MDRMuxOut, busOut, busMuxInMDR, PCdata, Mdatain;
    wire[15:0] reg_in, reg_out; 
    assign busOut = busMuxOut;
    // csigned extended
    // consult Figure 4 in the phase 2 instruction
	register_gen PC (PCdata, clear, clock, PC_en, busOut);
    register_gen IR (IRout, clear, clock, IR_en, busMuxInMDR);
    
    wire[31:0] cSignExtended;
    assign cSignExtended = {{14{IRout[18]}}, IRout[17:0]};
    //IR Decode
    select_encode ir_encode_select(reg_in, reg_out, Gra, Grb, Grc, 
                                    Rin, Rout, BAout, IRout);
                                    


    // memory
    memory_custom RAM (
                    .data_out(Mdatain),
                    .done(done),
                    .clk(clock), 
                    .addr(MARdata[8:0]), 
                    .data_in(busMuxInMDR), 
                    .read_enable(memRead), 
                    .write_enable(memWrite) 
                    );


    // RAM interface
    register_gen MAR (MARdata, clear, clock, MARin, busOut);
    mux_2_to_1 MDRMux (MDRMuxOut, busOut, Mdatain, memRead);
    register_gen MDR (busMuxInMDR, clear, clock, MDRin, MDRMuxOut);

    Datapath DUT (
            outPortData, busMuxOut,          // outputs
            inPortDataIn,                   // inputs
            clock, clear,                   // control signals  
            Yin, HIout, HIin, LOout, LOin,  // Data Path Signals
            Zhighout, Zlowout, Zin,         //
            PCout_en, IncPC, busMuxInPC,       // PC signals
            MDRout, busMuxInMDR,            // Memory data interface signal
            inPortEN, outPortEN,            // input/output
            Cout, cSignExtended,             // imediate value signals   
            opcode,                         // ALU opcode
            reg_in, reg_out, BAout          // register control signals
    );

endmodule