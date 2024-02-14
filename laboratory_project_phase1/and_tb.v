`timescale 1ns / 10ps

module and_tb;
    reg Clock, clear, // Clock and clear signal
        PCout, Zlowout, Zhighout, MDRout,  // Control signals
        MARin, Zin, PCin, MDRin, IRin, Yin, // More control signals
        IncPC, Read, AND, // Even more control signals
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
    reg [4:0] opcode;

    // State definitions
    parameter Default = 4'b0000, Reg_load1a = 4'b0001, Reg_load1b = 4'b0010, 
              Reg_load2a = 4'b0011, Reg_load2b = 4'b0100, Reg_load3a = 4'b0101, 
              Reg_load3b = 4'b0110, T0 = 4'b0111, T1 = 4'b1000, T2 = 4'b1001, 
              T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;
    
    reg [3:0] Present_state = Default;

    // Instantiate the Device Under Test (DUT)
    Datapath DUT (
            Clock, clear, 
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
            LOout, LOin,
            PCout, PCin, 
            Zhighout, Zlowout, Zin,
            MDRout, MDRin, MARin,
            IncPC, Read, IRin, Yin,
            Mdatain, opcode
    );

    // Clock generation
    initial begin
        Clock = 0;
        forever #10 Clock = ~Clock;
    end

    // State transitions
    always @(posedge Clock) begin
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
            T5: ;//Present_state = T6; // enable for division/multiplication
            // T6: ; // No next state defined for T6, assuming end of test or loop back to another state
        endcase
    end

    // State actions
    always @(Present_state) begin
        case (Present_state)
            Default: begin
                PCout <= 0; Zlowout <= 0; MDRout <= 0; R2out <= 0; R3out <= 0;
                MARin <= 0; Zin <= 0; PCin <= 0; MDRin <= 1; IRin <= 0; Yin <= 0;
                IncPC <= 0; Read <= 0; AND <= 0; R1in <= 0; R2in <= 0; R3in <= 0;
                Mdatain <= 32'h00000000;
            end
            Reg_load1a: begin   
                Mdatain <= 32'h00000000;  //prepare memory data for R2
                Read <= 0; MDRin <= 0;
                #10 Read <= 1; MDRin <= 1;
                #15 Read <= 0; MDRin <= 0;
            end
            Reg_load1b: begin
                #10 MDRout <= 1; R2in <= 1; 
                #15 MDRout <= 0; R2in <= 0; // initialize R2 with the value $12 
                end
            Reg_load2a: begin 
                Mdatain <= 32'h00000000;   //prepare memory data for R3
                #10 Read <= 1; MDRin <= 1; 
                #15 Read <= 0; MDRin <= 0; 
            end
            Reg_load2b: begin
                #10 MDRout <= 1; R3in <= 1; 
                #15 MDRout <= 0; R3in <= 0; // initialize R3 with the value $14 
            end
            Reg_load3a: begin 
                Mdatain <= 32'h00000000;    ////prepare memory data for R1
                #10 Read <= 1; MDRin <= 1; 
                #15 Read <= 0; MDRin <= 0;
            end
            Reg_load3b: begin
                #10 MDRout <= 1; R1in <= 1; 
                #15 MDRout <= 0; R1in <= 0; // initialize R1 with the value $18 
            end
            T0: begin // see if you need to de-assert these signals
                PCout <= 1; MARin <= 1; IncPC <= 1; Zin <= 1;
            end
            T1: begin
                Zlowout <= 1; PCin <= 1; Read <= 1; MDRin <= 1;
                Mdatain <= 32'h00000000; // opcode for “and R1, R2, R3”
                opcode <= 5'b0;
            end
            T2: begin
                MDRout <= 1; IRin <= 1; 
            end
            T3: begin
                R2out <= 1; Yin <= 1; 
            end
            T4: begin
                R3out <= 1; AND <= 1; Zin <= 1; 
            end
            T5: begin
                Zlowout <= 1; R1in <= 1;        
            end
            // T6: begin   //only for division and multiplication
            //     Zhighout <= 1;
            // end
            
            // Continue defining other states similarly...
        endcase
    end
endmodule
