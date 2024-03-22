`timescale 1ns / 10ps

module general_tb;
    reg[0:31] outPortData,               // output.
    reg[0:31] inPortDataIn,               // input.
    reg clock, clear,                     // control signals.
          Gra, Grb, Grc, Rin, Rout, BAout,  // control signals for IR
          PCout, IncPC, PCin, IRin,          // PC and IR signals.
          Yin, Hiout, Hiin, LOout, LOin,    // datapath MUX signals.
          Cout, Zhighout, Zlowout, Zin,     //
          MDRout, MDRin, MARin,             // Mem Data Interface signals.
          memRead, memWrite,                // memory read enable and write enable signals.
          outPortEN, outPortEN,             // Input/Output signals.
    reg[0:4] opcode

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
        Yin, Hiout, Hiin, LOout, LOin,  // datapath MUX signals.
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

    initial begin //Case 1: ld R2, 0x95
        
    end
    initial begin //Case 2: ld R0, 0x38
        
    end

    // State transitions
    always @(posedge clock) begin
        case (Present_state)
            Default: Present_state = Reg_load1a;
            Reg_load1a: Present_state = Reg_load1b;
            Reg_load1b: Present_state = Reg_load2a;
            Reg_load2a: Present_state = Reg_load2b;
            Reg_load2b: Present_state = Reg_load3a;
            Reg_load3a: Present_state = Reg_load3b;
            Reg_load3b: Present_state = T0;
            T0: Present_state = T1;
            T1: Present_state = T2;
            T2: Present_state = T3;
            T3: Present_state = T4;
            T4: Present_state = T5;
            T5: Present_state = Default;//Present_state = T6; // enable for division/multiplication
            // T6: ; // No next state defined for T6, assuming end of test or loop back to another state
        endcase
    end

    // State actions
    always @(Present_state) begin
        case (Present_state)
            Default: begin
                Gra <= 0; Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0; BAout <= 0; Yin <= 0;,
                Hiout <= 0; Hiin <= 0; LOout <= 0; LOin <= 0;
                PCout <= 0; PCin <= 0; IncPC <= 0; IRin <= 0;
                Zhighout <= 0; Zlowout <= 0; Zin <= 0;
                MDRout <= 0; MDRin <= 0; MARin <= 0; Read <= 0;
                InPortOut <= 0; OutPortIn <= 0;
                Cout <= 0;   
                opcode <= 5'b11010; //assert nop
            end

            T0: begin // 7
				MDRout <= 0; R0in <= 0; // initialize R1 with the value $18 
                PCout <= 1; MARin <= 1; IncPC <= 1; Zin <= 1;    
            end
            T1: begin //8
				PCout <= 0; MARin <= 0; IncPC <= 0; Zin <= 0;
                Zlowout <= 1; PCin <= 1; Read <= 1; 
				MDRin <= 1;					
            end
            T2: begin //9
				Zlowout <= 0; PCin <= 0; Read <= 0; MDRin <= 0;
                MDRout <= 1; IRin <= 1; 
            end
            T3: begin //10
				MDRout <= 0; IRin <= 0;
                Grb <= 1; BAout <= 1; Yin <= 1; 
            end
            T4: begin //11
			    Grb <= 0; BAout <= 0; Yin <= 0;
                Cout <= 16'h0095; opcode <= 5'b00011; Zin <= 1; 
            end
            T5: begin //12
				opcode <= 5'b11010; //assert nop
				Zin <= 0; 
                Zlowout <= 1; MARin <= 1; 
            end
            T6: begin //13   
                Zlowout <= 0; MARin <= 0; 
                Read <= 1; Mdatain <= ; MDRin <= 1;
            end
            T7: begin
                Read <= 0; MDRin <= 0;
                MDRout <= 1; Gra <= 1; Rin <= 1;
            end
            
            // Continue defining other states similarly...
        endcase
    end
endmodule
