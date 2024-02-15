`timescale 1ns / 10ps

module div_tb;
    reg clock, clear, // clock and clear signal
        PCout, Zlowout, Zhighout, MDRout, inPortOut,   // Control signals
        MARin, Zin, PCin, MDRin, IRin, Yin, // More control signals
        IncPC, Read, Cout, // Even more control signals
        R0out, R0in, 
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
        LOout, LOin;
    reg [31:0] Mdatain; // Data to be written
    reg [4:0] operation;

    // State definitions
    parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, 
              Reg_load2a = 4'b0011, Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, 
              Reg_load3b = 4'b0110, T0 = 4'b0111, T1 = 4'b1000, T2 = 4'b1001, 
              T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100, T6 = 4'b1101;
    
    reg [3:0] Present_state = Default;

    // Instantiate the Device Under Test (DUT)
    Datapath DUT (
            .clock(clock), .clear(clear), 
            .R0out(R0out), .R0in(R0in),
            .R1out(R1out), .R1in(R1out),
            .R2out(R2out), .R2in(R2in),
            .R3out(R3out), .R3in(R3in),
            .R4out(R4out), .R4in(R4in),
            .R5out(R5out), .R5in(R5in),
            .R6out(R6out), .R6in(R6in),
            .R7out(R7out), .R7in(R7in),
            .R8out(R8out), .R8in(R8in),
            .R9out(R9out), .R9in(R9in),
            .R10out(R10out), .R10in(R10in),
            .R11out(R11out), .R11in(R11in),
            .R12out(R12out), .R12in(R12in),
            .R13out(R13out), .R13in(R13in),
            .R14out(R14out), .R14in(R14in),
            .R15out(R15out), .R15in(R15in), 
            .HIout(HIout), .HIin(HIin),
            .LOout(LOout), .LOin(LOin),
            .PCout(PCout), .PCin(PCin), 
            .Zhighout(Zhighout), .Zlowout(Zlowout), .Zin(Zin),
            .MDRout(MDRout), .MDRin(MDRin), .MARin(MARin),
            .IncPC(IncPC), .Read(Read), .IRin(IRin), .Yin(Yin),
            .Mdatain(Mdatain), .opcode(operation), .Cout(Cout),
            .inPortOut(inPortOut)
    );

    // clock generation
    initial begin
        clock = 0;
        forever #10 clock = ~clock;
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
            T5: Present_state = T6;
				T6: Present_state = Default; // enable for division/multiplication
            // No next state defined for T6, assuming end of test or loop back to another state
        endcase
    end

    // State actions
    always @(Present_state) begin
        case (Present_state)
            Default: begin
                PCout <= 0; MDRout <= 0; MARin <= 0; Zin <= 0; 
                PCin <= 0; MDRin <= 0; IRin <= 0; Yin <= 0;
                IncPC <= 0; Read <= 0; R1in <= 0; 
                Cout <= 0; R2in <= 0; R3in <= 0;
                inPortOut <= 0; clear <= 0;
                Zlowout <= 0; Zhighout<= 0;
					 inPortOut <= 0;
                R0out <= 0; R0in <= 0;
                R1out <= 0; R1in <= 0;
                R2out <= 0; R2in <= 0; 
                R3out <= 0; R3in <= 0;
                R4out <= 0; R4in <= 0;
                R5out <= 0; R5in <= 0;
                R6out <= 0; R6in <= 0;
                R7out <= 0; R7in <= 0;
                R8out <= 0; R8in <= 0;
                R9out <= 0; R9in <= 0;
                R10out <= 0; R10in <= 0;
                R11out <= 0; R11in <= 0;
                R12out <= 0; R12in <= 0;
                R13out <= 0; R13in <= 0;
                R14out <= 0; R14in <= 0;
                R15out <= 0; R15in <= 0;
                HIout <= 0; HIin <= 0;
                LOout <= 0; LOin <= 0;
                Mdatain <= 32'h00000000;  
                operation <= 5'b01101; //assert nop
					 inPortOut <= 0;
            end
            Reg_load1a: begin   // 1
                Mdatain <= 32'h00000009;   //prepare memory data for R4
                Read <= 1; MDRin <= 1;
            end
            Reg_load1b: begin //2
					 Read <= 0; MDRin <= 0;
                MDRout <= 1; R4in <= 1; 
                end
            Reg_load2a: begin //3
					 MDRout <= 0; R4in <= 0; // initialize R4 with the value $9
                Mdatain <= 32'h00000002;   //prepare memory data for R5
                Read <= 1; MDRin <= 1; 
            end
            Reg_load2b: begin //4
					 Read <= 0; MDRin <= 0;
                MDRout <= 1; R5in <= 1; 
            end
            T0: begin // 7
				    MDRout <= 0; R5in <= 0; // initialize R5 with the value $2
                PCout <= 1; MARin <= 1; IncPC <= 1; Zin <= 1;    
            end
            T1: begin //8
				    PCout <= 0; MARin <= 0; IncPC <= 0; Zin <= 0;
                Zlowout <= 1; PCin <= 1; Read <= 1; MDRin <= 1;
                Mdatain <= 32'b10000_0100_0101_0000000000000000000; // opcode for “div R4, R5”
                
            end
            T2: begin //9
				    Zlowout <= 0; PCin <= 0; Read <= 0; MDRin <= 0;
                MDRout <= 1; IRin <= 1; 
                
            end
            T3: begin //10
				      
					 MDRout <= 0; IRin <= 0;
                R4out <= 1; Yin <= 1; 
                
            end
            T4: begin //11
				    R4out <= 0; Yin <= 0;
                R5out <= 1; operation <= 5'b10000; Zin <= 1; 
                
            end
            T5: begin //12
					 R5out <= 0; Zin <= 0; 
                Zlowout <= 1; LOin <= 1; // expected value: 4 (quotient)
            end
            T6: begin //13 only for division and multiplication
                Zlowout <= 0; LOin <= 0;
					 Zhighout <= 1; HIin <= 1; // expected value: 1 (remainder)
            end
            
            // Continue defining other states similarly...
        endcase
    end
endmodule
