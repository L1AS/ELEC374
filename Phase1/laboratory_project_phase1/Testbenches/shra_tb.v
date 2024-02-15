`timescale 1ns / 10ps

module shra_tb;
    reg Clock, clear, // Clock and clear signal
        PCout, Zlowout, Zhighout, MDRout,  // Control signals
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
              T3 = 4'b1010, T4 = 4'b1011, T5 = 4'b1100;
    
    reg [3:0] Present_state = Default;

    // Instantiate the Device Under Test (DUT)
    Datapath DUT (
            .clock(Clock), .clear(clear), 
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
            .Mdatain(Mdatain), .opcode(operation), .Cout(Cout)
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
            T5: ;
        endcase
    end

    // State actions
    always @(Present_state) begin
        case (Present_state)
            Default: begin
                PCout <= 0; Zlowout <= 0; MDRout <= 0; R2out <= 0; R3out <= 0;
                MARin <= 0; Zin <= 0; PCin <= 0; MDRin <= 0; IRin <= 0; Yin <= 0;
                IncPC <= 0; Read <= 0; R1in <= 0; Cout <= 0; R2in <= 0; R3in <= 0;
                Mdatain <= 32'h00000000;
            end
            Reg_load1a: begin   
                Mdatain <= 32'hfff0ffff;  // prepare memory data for R2
                Read <= 0; MDRin <= 0;
                #10 Read <= 1; MDRin <= 1;
                #15 Read <= 0; MDRin <= 0;
            end
            Reg_load1b: begin
                #10 MDRout <= 1; R2in <= 1; 
                #15 MDRout <= 0; R2in <= 0; // initialize R2 with the value $1
                end
            Reg_load2a: begin 
                Mdatain <= 32'h0000004;   // prepare memory data for R3
                #10 Read <= 1; MDRin <= 1; 
                #15 Read <= 0; MDRin <= 0; 
            end
            Reg_load2b: begin
                #10 MDRout <= 1; R3in <= 1; 
                #15 MDRout <= 0; R3in <= 0; // initialize R3 with the value $1
            end
            Reg_load3a: begin 
                Mdatain <= 32'h00000000;    // prepare memory data for R1
                #10 Read <= 1; MDRin <= 1; 
                #15 Read <= 0; MDRin <= 0;
            end
            Reg_load3b: begin
                #10 MDRout <= 1; R1in <= 1; // expected output: 32'hffff0fff
                #15 MDRout <= 0; R1in <= 0; // initialize R1 with the value $0
            end
            T0: begin // see if you need to de-assert these signals
                PCout <= 1; MARin <= 1; IncPC <= 1; Zin <= 1;
                #15 PCout <= 0; MARin <= 0; IncPC <= 0; Zin <= 0;
            end
            T1: begin
                #10 Zlowout <= 1; PCin <= 1; Read <= 1; MDRin <= 1;
                Mdatain <= 32'h00000007; // opcode for “shra R1, R2, R3”
                #15 Zlowout <= 0; PCin <= 0; Read <= 0; MDRin <= 0;
            end
            T2: begin
                MDRout <= 1; IRin <= 1; 
                #15 MDRout <= 0; IRin <= 0;
            end
            T3: begin
                R2out <= 1; Yin <= 1; 
                #15 R2out <= 0; Yin <= 0;
            end
            T4: begin
                operation <= 5'b00111; Zin <= 1; 
                #15 Zin <= 0; 
            end
            T5: begin
                Zlowout <= 1; R1in <= 1; 
                #15 Zlowout <= 0; R1in <= 0;        
            end
        endcase
    end
endmodule
