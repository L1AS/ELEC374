`timescale 1ns/10ps

module control_unit (
    // Define the inputs and outputs to your Control Unit here
    output reg Gra, Grb, Grc, Rin, Rout, BAout,         // control signals for IR select/encode
    PCout_en, IncPC, PC_en, IR_en,                      // PC and IR signals
    Yin, HIout, HIin, LOout, LOin,                      // datapath MUX signals
    Cout, Zhighout, Zlowout, Zin,                       // datapath MUX signals
    MDRout, MDRin, MARin,                               // Mem Data Interface signals
    memRead, memWrite,                                  // memory read enable and write enable signals
    inPort_en, outPort_en,                              // Input/Output signals
    inPortOut, jal_R15,
    CONin, 
    clear, run,
    
    output [31:0] inPortDataIn,               	  // inputs??? NOT SURE IF NEED HERE
    output reg [4:0] alu_opcode,                          // ALU opcode

    input [31:0] IR,
    input clock, reset, stop, CON_FF_out
); 

// State declaration
parameter reset_state = 8'b00000000, fetch0 = 8'b00000001, fetch1 = 8'b00000010, fetch2 = 8'b00000011, 
            ld3 = 8'b00000100, ld4 = 8'b00000101, ld5 = 8'b00000110, ld6 = 8'b00000111, ld7 = 8'b00001000, 
            ldi3 = 8'b00001001, ldi4 = 8'b00001010, ldi5 = 8'b00001011, 
            st3 = 8'b00001100, st4 = 8'b00001101, st5 = 8'b00001110, st6 = 8'b00001111, st7 = 8'b00010000, 
            add3 = 8'b00010001, add4 = 8'b00010010, add5 = 8'b00010011, 
            sub3 = 8'b00010100, sub4 = 8'b00010101, sub5 = 8'b00010110, 
            shr3 = 8'b00010111, shr4 = 8'b00011000, shr5 = 8'b00011001, 
            shra3 = 8'b00011010, shra4 = 8'b00011011, shra5 = 8'b00011100, 
            shl3 = 8'b00011101, shl4 = 8'b00011110, shl5 = 8'b00011111, 
            ror3 = 8'b00100000, ror4 = 8'b00100001, ror5 = 8'b00100010, 
            rol3 = 8'b00100011, rol4 = 8'b00100100, rol5 = 8'b00100101, 
            and3 = 8'b00100110, and4 = 8'b00100111, and5 = 8'b00101000, 
            or3 = 8'b00101001, or4 = 8'b00101010, or5 = 8'b00101011, 
            addi3 = 8'b00101100, addi4 = 8'b00101101, addi5 = 8'b00101110, 
            andi3 = 8'b00101111, andi4 = 8'b00110000, andi5 = 8'b00110001, 
            ori3 = 8'b00110010, ori4 = 8'b00110011, ori5 = 8'b00110100, 
            mul3 = 8'b00110101, mul4 = 8'b00110110, mul5 = 8'b00110111, mul6 = 8'b00111000, 
            div3 = 8'b00111001, div4 = 8'b00111010, div5 = 8'b00111011, div6 = 8'b00111100, 
            neg3 = 8'b00111101, neg4 = 8'b00111110, neg5 = 8'b00111111, 
            not3 = 8'b01000000, not4 = 8'b01000001, not5 = 8'b01000010, 
            br3 = 8'b01000011, br4 = 8'b01000100, br5 = 8'b01000101, br6 = 8'b01000110, br7 = 8'b01000111, 
            jr3 = 8'b01001000, jal3 = 8'b01001001, jal4 = 8'b01001010, 
            in3 = 8'b01001011, out3 = 8'b01001100, 
            mfhi3 = 8'b01001101, mflo3 = 8'b01001110, 
            nop3 = 8'b01001111, halt3 = 8'b01010000;

// Present state
reg [7:0] present_state = reset_state; // Adjust the bit pattern based on the number of states

// Finite State Machine; if clock or reset rising-edge
always @(posedge Clock, posedge reset) 
begin 
    if (reset == 1'b1) begin
        present_state = reset_state;
    end else if (stop == 1'b1) begin
        present_state = halt3;
    end else 
        case (present_state) 
            reset_state: present_state = fetch0;
            fetch0: present_state = fetch1;
            fetch1: present_state = fetch2;
            fetch2: begin
                case (IR[31:27]) // Instruction decoding based on the opcode to set the next state 
                    5'b00000: present_state = ld3; // Load
                    5'b00001: present_state = ldi3; // Load Immediate
                    5'b00010: present_state = st3; // Store
                    5'b00011: present_state = add3; // Addition
                    5'b00100: present_state = sub3; // Substraction
                    5'b00101: present_state = shr3; // Shift right
                    5'b00110: present_state = shra3; // Shift right arithmetic
                    5'b00111: present_state = shl3; // Shift left
                    5'b01000: present_state = ror3; // Rotate right
                    5'b01001: present_state = rol3; // Rotate left
                    5'b01010: present_state = and3; // And
                    5'b01011: present_state = or3; // Or
                    5'b01100: present_state = addi3; // Add Immediate
                    5'b01101: present_state = andi3; // And Immediate
                    5'b01110: present_state = ori3; // Or Immediate
                    5'b01111: present_state = mul3; // Multiply
                    5'b10000: present_state = div3; // Divison
                    5'b10001: present_state = neg3; //Negate
                    5'b10010: present_state = not3; // Not
                    5'b10011: present_state = br3; // branch
                    5'b10100: present_state = jr3; // Jump Return
                    5'b10101: present_state = jal3; // Jump Address Link
                    5'b10110: present_state = in3; //Input
                    5'b10111: present_state = out3; // Output
                    5'b11000: present_state = mfhi3; // Move from HI
                    5'b11001: present_state = mflo3; // Move from LO
                    5'b11010: present_state = nop3; // NOP
                    5'b11011: present_state = halt3; // Halt
                endcase
            end
            ld3: present_state = ld4;
            ld4: 
            ⁞
            ldi3: present_state = ldi4;
            ldi4:
            ⁞
            st3: present_state = st4;
            st4:
            ⁞
            add3: present_state = add4;
            add4: present_state = add5;
            ⁞
            sub3: present_state = sub4;
            sub4: 
            ⁞
            shr3: present_state = shr4;
            shr4:
            ⁞
            shra3: present_state = shra4;
            shra4:
            ⁞
            shl3: present_state = shl4;
            shl4:
            ⁞
            
            
            
        endcase
end

// Perform actions based on the current state
always @(present_state) 
begin
    case (present_state) // Assert the required signals in each state
        reset_state: begin
            Gra <= 0; Grb <= 0; Grc <= 0; Yin <= 0; // Initialize the signals
            ⁞
        end
        fetch0: begin 
            PCout <= 1; // See if you need to de-assert these signals 
            MARin <= 1; 
            IncPC <= 1; 
            Zin <= 1;
        end
        add3: begin
            Grb <= 1; Rout <= 1; 
            Yin <= 1; 
        end
        ⁞
    endcase
end

endmodule
