module miniSRC(
    output[31:0] outPortData,               // output.
    output run,
    input[31:0] inPortDataIn,               // input.
    input clock, reset, stop, inPort_en
);

    wire [7:0] display_lower_hex, display_upper_hex;

    wire Gra, Grb, Grc, Rin, Rout, BAout,         // control signals for IR select/encode
        PCout_en, IncPC, PC_en, IR_en,                      // PC and IR signals
        Yin, HIout, HIin, LOout, LOin,                      // datapath MUX signals
        Cout, Zhighout, Zlowout, Zin,                       // datapath MUX signals
        MDRout, MDRin, MARin,                               // Mem Data Interface signals
        memRead, memWrite,                                  // memory read enable and write enable signals
        outPort_en,                              // Input/Output signals
        inPortOut, jal_R15,
        CONin, CONFF_out, 
        clear;
	
	wire [4:0] alu_opcode;		//conff logic signals for branch

	wire[31:0] IRout, MARdata, MDRMuxOut, busMuxInMDR, Mdatain, busMuxOut, busMuxInPC;
    wire[15:0] reg_in, reg_out; 

    con_ff branch_condition(
        CONFF_out, CONin, IRout, busMuxOut
    );

    seven_segment_display display_upper(
        .outputt(display_upper_hex), .clk(clock), .data(outPortData[7:4])
    );
    seven_segment_display display_lower(
        .outputt(display_lower_hex), .clk(clock), .data(outPortData[3:0])
    );

    // csigned extended
    // consult Figure 4 in the phase 2 instruction
	register_gen PC (busMuxInPC, clear, clock, PC_en, busMuxOut);
    register_gen IR (IRout, clear, clock, IR_en, busMuxOut);
    
    wire[31:0] cSignExtended;
    assign cSignExtended = {{14{IRout[18]}}, IRout[17:0]};
    //IR Decode
    select_encode ir_encode_select(reg_in, reg_out, Gra, Grb, Grc, 
                                    Rin, Rout, BAout, IRout);

     // memory
     memory_custom RAM (
                     .data_out(Mdatain),
                     .addr(MARdata[8:0]), 
                     .data_in(busMuxInMDR), 
                     .read_enable(memRead), 
                     .write_enable(memWrite) 
                     );
//
//    memory RAM (.address(MARdata[8:0]),
//                     .clock(clock),
//                     .data(busMuxInMDR),
//                     .rden(memRead),
//                     .wren(memWrite),
//                     .q(Mdatain)
//					);
    


    // RAM interface
    register_gen MAR (MARdata, clear, clock, MARin, busMuxOut);
    mux_2_to_1 MDRMux (MDRMuxOut, busMuxOut, Mdatain, memRead);
    register_gen MDR (busMuxInMDR, clear, clock, MDRin, MDRMuxOut);

    control_unit control(
        .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .BAout(BAout),
        .PCout_en(PCout_en), .IncPC(IncPC), .PC_en(PC_en), .IR_en(IR_en),
        .Yin(Yin), .HIout(HIout), .HIin(HIin), .LOout(LOout), .LOin(LOin),
        .Cout(Cout), .Zhighout(Zhighout), .Zlowout(Zlowout), .Zin(Zin),
        .MDRout(MDRout), .MDRin(MDRin), .MARin(MARin), 
        .memRead(memRead), .memWrite(memWrite),
        .outPort_en(outPort_en),
        .CONin(CONin), .clear(clear), .run(run), 
        .alu_opcode(alu_opcode), .IR(IRout), 
        .clock(clock), .reset(reset), .stop(stop), .CONFF_out(CONFF_out),
        .inPortOut(inPortOut), .jal_R15(jal_R15)
    );

    Datapath DUT (
        .outPortData(outPortData), .busMuxOut(busMuxOut),          // outputs
        .inPortDataIn(inPortDataIn),                   // inputs
        .clock(clock), .clear(clear),                    // control signals  
        .Yin(Yin), .HIout(HIout), .HIin(HIin), .LOout(LOout), .LOin(LOin),      // datapath MUX signals.
        .Zhighout(Zhighout), .Zlowout(Zlowout), .Zin(Zin),         //
        .PCout_en(PCout_en), .IncPC(IncPC), .busMuxInPC(busMuxInPC),       // PC signals
        .MDRout(MDRout), .inPortOut(inPortOut), .busMuxInMDR(busMuxInMDR),            // Memory data interface signal
        .inPort_en(inPort_en), .outPort_en(outPort_en),            // input/output
        .Cout(Cout), .cSignExtended(cSignExtended),             // imediate value signals   
        .alu_opcode(alu_opcode),                                                         //ALU opcode 
        .reg_in(reg_in), .reg_out(reg_out), .BAout(BAout),          // register control signals
        .jal_R15(jal_R15)
    );

endmodule