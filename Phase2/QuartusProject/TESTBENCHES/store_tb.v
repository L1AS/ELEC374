`timescale 1ns / 10ps

module store_tb;
    wire[31:0] outPortData;                  // output.
    wire CONFF_out;
    reg CONin;                   // branch logic signals
    reg[31:0] inPortDataIn;               // input.
    reg clock, clear,                     // control signals.
          Gra, Grb, Grc, Rin, Rout, BAout,  // control signals for IR
          PCout_en, IncPC, PC_en, IRin,          // PC and IR signals.
          Yin, HIout, HIin, LOout, LOin,    // datapath MUX signals.
          Cout, Zhighout, Zlowout, Zin,     //
          MDRout, MDRin, MARin,             // Mem Data Interface signals.
          memRead, memWrite,                // memory read enable and write enable signals.
          inPort_en, outPort_en,             // Input/Output signals.
          inPortOut, jal_R15;
    reg[4:0] opcode;

    // State definitions
    parameter Default = 5'b00000, T0 = 5'b00001, T1 = 5'b00010, T2 = 5'b00011, 
              T3 = 5'b00100, T4 = 5'b00101, T5 = 5'b00110, T6 = 5'b00111, T7 = 5'b01000, T8 = 5'b01001,
              memWait1 = 5'b01100, memWait2 = 5'b01101, memWait3 = 5'b01110, memWait4 = 5'b01111, 
              preload_reg = 5'b10000, readBack1 = 5'b11010, readBack2 = 5'b11011, readBack3 = 5'b11100, 
              readBack4 = 5'b11101, readBack5 = 5'b11110, readBack6 = 5'b11111;

              
    reg [4:0] Present_state = Default;

    // Instantiate the Device Under Test (DUT)
    miniSRC CPU(
        .outPortData(outPortData),                                              // output.
        .CONFF_out(CONFF_out), .CONin(CONin),                                   // branch logic signals
        .inPortDataIn(inPortDataIn),                                            // input.                                
        .clock(clock), .clear(clear),                                           // control signals.
        .Gra(Gra), .Grb(Grb), .Grc(Grc), .Rin(Rin), .Rout(Rout), .BAout(BAout), // control signals for IR
        .PCout_en(PCout_en), .IncPC(IncPC), .PC_en(PC_en), .IR_en(IRin),                 // PC and IR signals.
        .Yin(Yin), .HIout(HIout), .HIin(HIin), .LOout(LOout), .LOin(LOin),      // datapath MUX signals.
        .Cout(Cout), .Zhighout(Zhighout), .Zlowout(Zlowout), .Zin(Zin),         //
        .MDRout(MDRout), .MDRin(MDRin), .MARin(MARin),                          // Mem Data Interface signals.
        .memRead(memRead), .memWrite(memWrite),                                 // memory read enable and write enable signals.
        .inPort_en(inPort_en), .outPort_en(outPort_en),                          // Input/Output signals.
        .inPortOut(inPortOut), .jal_R15(jal_R15),
        .opcode(opcode)                                                         //ALU opcode 
    );

    // clock generation
    initial begin
        clock = 0;
        forever #10 clock = ~clock;
    end

    // State transitions
    always @(posedge clock) begin
        case (Present_state)
            Default: Present_state = T0;
            T0: Present_state = T1;
            T1: Present_state = memWait1;
            memWait1: Present_state = memWait2;
            memWait2: Present_state = T2;
            T2: Present_state = preload_reg;
            preload_reg: Present_state = T3;
            T3: Present_state = T4;
            T4: Present_state = T5;
            T5: Present_state = T6;
            T6: Present_state = memWait3; //load and branch
            memWait3: Present_state = T7;
            T7: Present_state = readBack1; //load 
            readBack1: Present_state = readBack2;
            readBack2: Present_state = readBack3;
            readBack3: Present_state = readBack4;
            readBack4: Present_state = readBack5;
            readBack5: Present_state = readBack6;
            readBack6: Present_state = Default;
        endcase
    end
    // State actions
    always @(Present_state) begin
        case (Present_state)
                Default: begin
                    inPortDataIn <= 32'h0000043; inPort_en <= 1;            // input.
                    clear <= 0; jal_R15 <= 0; CONin <= 0;                   // control signals.
                    Gra <= 0; Grb <= 0; Grc <= 0;                           // control signals for IR
                    Rin <= 0; Rout <= 0; BAout <= 0;                        //
                    PCout_en <= 0; IncPC <= 0; PC_en <= 0; IRin <= 0;       // PC and IR signals.
                    Yin <= 0; HIout <= 0; HIin <= 0; LOout <= 0; LOin <= 0; // datapath MUX signals.
                    Cout <= 0; Zhighout <= 0; Zlowout <= 0; Zin <= 0;       //
                    MDRout <= 0; MDRin <= 0; MARin <= 0;                    // Mem Data Interface signals.
                    memRead <= 0; memWrite <= 0;                            // memory read enable and write enable signals.
                    outPort_en <= 0; inPortOut <= 0;                        // Input/Output signals.
                    opcode <= 5'b11010;                                     // assert nop
                end
                T0: begin // 1
                    inPort_en <= 0;
                    PCout_en <= 1; MARin <= 1; IncPC <= 1; Zin <= 1;    // prepare for increment PC via ALU
                end
                T1: begin //2
                    PCout_en <= 0; MARin <= 0; IncPC <= 0; Zin <= 0;
                    Zlowout <= 1; PC_en <= 1; memRead <= 1; MDRin <= 1;	// PC incremented (taking value calculated in Z), read IR content from memory?			
                end
                memWait1: begin
                    Zlowout <= 0; PC_en <= 0;
                end
                memWait2: begin
                    
                end
                T2: begin //3
                    memRead <= 0; MDRin <= 0;
                    MDRout <= 1; IRin <= 1; // assert content from memory to IR
                end
                preload_reg: begin
                    MDRout <= 0; IRin <= 0;
                    Gra <= 1; Rin <= 1; inPortOut <= 1; //pre-load Ra
                end
                T3: begin //4
                    Gra <= 0; Rin <= 0; inPortOut <= 0;
                    Grb <= 1; BAout <= 1; Yin <= 1; // select register Rb by assert Grb and BAout signals, put the content of Rb in Y register
                end
                T4: begin //5
                    Grb <= 0; BAout <= 0; Yin <= 0;
                    Cout <= 1; opcode <= 5'b00011; Zin <= 1; // assert Cout to high -> get Csignextended (immediate), opcode for ADD, assert output of addtion to Z register
                end
                T5: begin //6
                    Cout <= 0;
                    opcode <= 5'b11010; //assert nop
                    Zin <= 0; 
                    Zlowout <= 1; MARin <= 1;  // get the result (new address by adding content in Rb and the immediate) in Z register, assert MARin to move the address to the MAR
                end
                T6: begin //7   
                    Zlowout <= 0; MARin <= 0; 
                    Gra <= 1; Rout <= 1; MDRin <= 1; memWrite <= 1;// write the contents in Ra, to the address in MDR
                end
                memWait3: begin
                    Gra <= 0; Rout <= 0; MDRin <= 0;
                end
                T7: begin //8
                    memWrite <= 0; Gra <= 0; Rout <= 0;
                    inPortDataIn <= 32'h0000087; inPort_en <= 1;
                end
                readBack1: begin
                    inPort_en <= 0;
                    inPortOut <= 1; MARin <= 1;
                    memRead <= 1;
                end
                readBack2: begin
                    inPortOut <= 0; MARin <= 0;
                end
                readBack3: begin
                    memRead <= 0;
                    inPortDataIn <= 32'h00000CA; inPort_en <= 1;
                end
                readBack4: begin
                    inPort_en <= 0;
                    inPortOut <= 1; MARin <= 1;
                    memRead <= 1;
                end
                readBack5: begin
                    inPortOut <= 0; MARin <= 0;
                end
                readBack6: begin
                    memRead <= 0;
                end
            
            // Continue defining other states similarly...
        endcase
    end
endmodule
