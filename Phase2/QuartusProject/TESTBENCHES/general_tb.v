`timescale 1ns / 10ps

module general_tb;
    reg[31:0] outPortData,               // output.
    reg[31:0] inPortDataIn,               // input.
    reg clock, clear,                     // control signals.
          Gra, Grb, Grc, Rin, Rout, BAout,  // control signals for IR
          PCout, IncPC, PCin, IRin,          // PC and IR signals.
          Yin, Hiout, HIin, LOout, LOin,    // datapath MUX signals.
          Cout, Zhighout, Zlowout, Zin,     //
          MDRout, MDRin, MARin,             // Mem Data Interface signals.
          memRead, memWrite,                // memory read enable and write enable signals.
          outPortEN, outPortEN,             // Input/Output signals.
    reg[4:0] opcode

    // State definitions
    parameter Default = 4'b0000, T0 = 4'b0001, T1 = 4'b0010, T2 = 4'b0011, 
              T3 = 4'b0100, T4 = 4'b0101, T5 = 4'b0111;
    
    reg [3:0] Present_state = Default;

    // Instantiate the Device Under Test (DUT)
    miniSRC CPU(
        outPortData,                    // output.
        inPortDataIn,                   // input.
        clock, clear,                   // control signals.
        Gra, Grb, Grc, Rin, Rout, BAout,// control signals for IR
        PCout, IncPC, PCin, IRin,       // PC and IR signals.
        Yin, Hiout, HIin, LOout, LOin,  // datapath MUX signals.
        Cout, Zhighout, Zlowout, Zin,   //
        MDRout, MDRin, MARin,           // Mem Data Interface signals.
        memRead, memWrite,              // memory read enable and write enable signals.
        outPortEN, outPortEN,           // Input/Output signals.
        opcode                          //ALU opcode
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
            T1: Present_state = T2;
            T2: Present_state = T3;
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
                    outPortData <= 0;                                       // output.
                    inPortDataIn <= 0;                                      // input.
                    clock <= 0; clear <= 0;                                 // control signals.
                    Gra <= 0; Grb <= 0; Grc <= 0;                           // control signals for IR
                    Rin <= 0; Rout <= 0; BAout <= 0;                        //
                    PCout <= 0; IncPC <= 0; PCin <= 0; IRin <= 0;           // PC and IR signals.
                    Yin <= 0; Hiout <= 0; HIin <= 0; LOout <= 0; LOin <= 0; // datapath MUX signals.
                    Cout <= 0; Zhighout <= 0; Zlowout <= 0; Zin <= 0;       //
                    MDRout <= 0; MDRin <= 0; MARin <= 0;                    // Mem Data Interface signals.
                    memRead <= 0; memWrite <= 0;                            // memory read enable and write enable signals.
                    outPortEN <= 0; outPortEN <= 0;                         // Input/Output signals.
                    opcode <= 5'b11010;                                     // assert nop
            end
            T0: begin // 1
				PCout <= 1; MARin <= 1; IncPC <= 1; Zin <= 1;    // prepare for increment PC via ALU
            end
            T1: begin //2
				PCout <= 0; MARin <= 0; IncPC <= 0; Zin <= 0;
                Zlowout <= 1; PCin <= 1; memRead <= 1; MDRin <= 1;	// PC incremented (taking value calculated in Z), read IR content from memory?			
            end
            T2: begin //3
				Zlowout <= 0; PCin <= 0; memRead <= 0; MDRin <= 0;
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
                memRead <= 1; MDRin <= 1; // read the content in the new address, put the content to MDR
            end
            T7: begin //8
                memRead <= 0; MDRin <= 0;
                MDRout <= 1; Gra <= 1; Rin <= 1; // put the content of MDR to Ra
            end
            
            // Continue defining other states similarly...
        endcase
    end
endmodule
