// this is the Verilog sample code for Method 2 for the Control Unit
`timescale 1ns/10ps
module control_unit ( 
    output reg Gra, Grb, Grc, Rin, …, Rout, // define the inputs and outputs to your Control Unit here
                Yin, Zin, PCout, IncPC, Zlowout, …, MARin,
                Read, Write, …, Clear,
                ADD, AND, …, SHR,
    input [31:0] IR, 
    input Clock, Reset, Stop, …, Con_FF); 


    parameter reset_state = 4’b0000, S0 = 4’b0001, S1 = 4’b0010, …; 
    reg [3:0] present_state = reset_state; // adjust the bit pattern based on the number of states
    reg T0, T1, T2, T3, T4, T5, ..., ;
    reg ADD_s, SUB_s, AND_s, OR_s, ..., : 
    always @(posedge Clock, posedge Reset, …) // finite state machine; if clock or reset rising-edge
    begin
    if (Reset == 1’b1) present_state = reset_state; 
    else begin
    T0 <= 0; T1 <= 0; T2 <= 0; T3 <= 0; T4 <= 0; T5 <= 0;
    case (present_state)
    reset_state: begin
    present_state = S0;
    T0 <= 1;
    end
    S0: begin
    present_state = S1;
    T1 <= 1;
    end
    ⁞
    endcase
    end
    end
    6
    always @(IR)
    begin
    ADD_s <= 0; AND_s <= 0; …
    case (IR[31:27]) // inst. decoding based on the opcode
    5’b00011: ADD_s <= 1; // this is the add instruction 
    5’b01010: AND_s <= 1; // this is the and instruction
    ⁞
    endcase
    end
    always @(Clock, T0, T1, …)
    begin
    ADD <= ADD_s && T4; // control signal assignment
    Zlowout <= T1 || (T5 && (AND_s || OR_s || ADD_s || SUB_s || …)) || …;
    ⁞
    end
endmodule