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
          inPortOut;
    reg[4:0] opcode;

    // State definitions
    parameter Default = 4'b0000, T0 = 4'b0001, T1 = 4'b0010, T2 = 4'b0011, 
              T3 = 4'b0100, T4 = 4'b0101, T5 = 4'b0111, T6 = 4'b1000, T7 = 4'b1001,
              memWait = 4'b1111, initializeReg = 4'b1110;
              
    
    reg [3:0] Present_state = Default;

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
        .inPortOut(inPortOut),
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
            Default: Present_state = initializeReg;
            initialReg: = Present_state = T0;
            T0: Present_state = T1;
            T1: Present_state = T2;
            T2: Present_state = memWait;
            memWait: Present_state = T3;
            T3: Present_state = T4;
            T4: Present_state = T5;
            T5: Present_state = T6;
            T6: Present_state = T7; //load and branch
            T7: Present_state = Default; //load 
        endcase
    end

    // State actions
    always @(Present_state) begin
        case (Present_state)
                Default: begin
                    inPortDataIn <= 32'h0000043; inPort_en <= 1;                           // input.
                    clock <= 0; clear <= 1;                                 // control signals.
                    Gra <= 0; Grb <= 0; Grc <= 0;                           // control signals for IR
                    Rin <= 0; Rout <= 0; BAout <= 0;                        //
                    PCout_en <= 0; IncPC <= 0; PC_en <= 0; IRin <= 0;       // PC and IR signals.
                    Yin <= 0; HIout <= 0; HIin <= 0; LOout <= 0; LOin <= 0; // datapath MUX signals.
                    Cout <= 0; Zhighout <= 0; Zlowout <= 0; Zin <= 0;       //
                    MDRout <= 0; MDRin <= 0; MARin <= 0;                    // Mem Data Interface signals.
                    memRead <= 0; memWrite <= 0;                            // memory read enable and write enable signals.
                    outPort_en <= 0;                                        // Input/Output signals.
                    opcode <= 5'b11010;                                     // assert nop
                end
                initializeReg1: begin
                    inPort_en <= 0; clear <= 0;
                    PCout_en <= 1; MARin <= 1; IncPC <= 1; Zin <= 1;    // prepare for increment PC via ALU
                end
                initializeReg2: begin
                    PCout_en <= 0; MARin <= 0; IncPC <= 0; Zin <= 0;
                    Zlowout <= 1; PC_en <= 1; memRead <= 1; MDRin <= 1;	// PC incremented (taking value calculated in Z), read IR content from memory?	
                end
                initializeReg3: begin
                    
                end
                initializeReg4: begin
                    Zlowout <= 0; PC_en <= 0; memRead <= 0; MDRin <= 0;
                    MDRout <= 1; IRin <= 1; // assert content from memory to IR
                end
                initializeReg5: begin
                    Gra <= 1; Rin <= 1; inPortOut <= 1;
                end
                T0: begin // 1
                    Gra <= 0; Rin <= 0; inPortOut <= 0;
                    clear <= 0;
                    PCout_en <= 1; MARin <= 1; IncPC <= 1; Zin <= 1;    // prepare for increment PC via ALU
                end
                T1: begin //2
                    PCout_en <= 0; MARin <= 0; IncPC <= 0; Zin <= 0;
                    Zlowout <= 1; PC_en <= 1; memRead <= 1; MDRin <= 1;	// PC incremented (taking value calculated in Z), read IR content from memory?			
                end
                memWait: begin
                    
                end
                T2: begin //3
                    Zlowout <= 0; PC_en <= 0; memRead <= 0; MDRin <= 0;
                    MDRout <= 1; IRin <= 1; // assert content from memory to IR
                end
                T3: begin //4
                    MDRout <= 0; IRin <= 0;
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
                    memWrite <= 1; Gra <= 1; Rout <= 1;// write the contents in Ra, to the address in MAR
                end
                T7: begin //8
                    memWrite <= 0; Gra <= 0; Rout <= 0;
                end
            
            // Continue defining other states similarly...
        endcase
    end
endmodule
