`timescale 1ns/10ps

module control_unit (
    // Define the inputs and outputs to your Control Unit here
    output reg Gra, Grb, Grc, Rin, BAout, Rout,
    Yin, PCout, IncPC, PC_en, IR_en, HIout,
    HIn, LOout, LOin, Cout, Zhighout, Zlowout, Zin,
    MDRout, MDRin, MARin, memRead, memWrite, jal_R15,
    CONin, clear,
    // ADD, SUB, SHR, SHRA, SHL, ROR, ROL, AND, OR, ADDI, ANDI, ORI, MUL,
    // DIV, NEG, NOT, BR
    input [31:0] IR,
    input clock, reset, Stop, …, CON_FF
); 

// State declaration
parameter reset_state= 8'b00000000, fetch0 = 8'b00000001, fetch1 = 8'b00000010, fetch2= 8'b00000011, 
            ld3 = 8'b00101010, ld4 = 8'b00101011, ld5 = 8'b00101100, ld6 = 8'b00101101, ld7 = 8'b00101110,
            ldi3 = 8'b00101111, ldi4 = 8'b00110000, ldi5 = 8'b00110001,
            st3 = 8'b00110010, st4 = 8'b00110011, st5 = 8'b00110100, st6 = 8'b00110101, st7 = 8'b00110110, 
            add3 = 8'b00000100, add4= 8'b00000101, add5= 8'b00000110, sub3 = 8'b00000111, sub4 = 8'b00001000, sub5 = 8'b00001001,
            mul3 = 8'b00001010, mul4 = 8'b00001011, mul5 = 8'b00001100, mul6 = 8'b00001101, 
            div3 = 8'b00001110, div4 = 8'b00001111, div5 = 8'b00010000, div6 = 8'b00010001, 
            or3 = 8'b00010010, or4 = 8'b00010011, or5 = 8'b00010100, and3 = 8'b00010101, and4 = 8'b00010110, and5 = 8'b00010111, 
            shl3 = 8'b00011000, shl4 = 8'b00011001, shl5 = 8'b00011010, shr3 = 8'b00011011, shr4 = 8'b00011100, shr5 = 8'b00011101, 
            rol3 = 8'b00011110, rol4 = 8'b00011111, rol5 = 8'b00100000, ror3 = 8'b00100001, ror4 = 8'b00100010, ror5 = 8'b00100011, 
            neg3 = 8'b00100100, neg4 = 8'b00100101, neg5 = 8'b00100110, not3 = 8'b00100111, not4 = 8'b00101000, not5 = 8'b00101001,    addi3 = 8'b00110111, addi4 = 8'b00111000, addi5 = 8'b00111001,
            andi3 = 8'b00111010, andi4 = 8'b00111011, andi5 = 8'b00111100, ori3 = 8'b00111101, ori4 = 8'b00111110, ori5 = 8'b00111111,
            br3 = 8'b01000000, br4 = 8'b01000001, br5 = 8'b01000010, br6 = 8'b01000011, br7 = 8'b11111111, jr3 = 8'b01000100, jal3 = 8'b01000101, 
            jal4 = 8'b01000110, mfhi3 = 8'b01000111, mflo3 = 8'b01001000, in3 = 8'b01001001, out3 = 8'b01001010, nop3 = 8'b01001011, 
            halt3 = 8'b01001100;

// Present state
reg [3:0] present_state = reset_state; // Adjust the bit pattern based on the number of states

// Finite State Machine; if clock or reset rising-edge
always @(posedge Clock, posedge Reset) 
begin 
    if (Reset == 1'b1) 
        present_state = reset_state;
    else 
        case (present_state) 
            reset_state: present_state = fetch0;
            fetch0: present_state = fetch1;
            fetch1: present_state = fetch2;
            fetch2: begin
                case (IR[31:27]) // Instruction decoding based on the opcode to set the next state 
                    5'b00000: present_state = ld3; // This is the add instruction 
                    5'b00001: present_state = ldi3;
                    5'b00010: present_state = st3;
                    5'b00011: present_state = add3;
                    5'b00100: present_state = sub3;
                    5'b00101: present_state = shr3;
                    5'b00110: present_state = shra3;
                    5'b00111: present_state = shl3;
                    5'b01000: present_state = ror3;
                    5'b01001: present_state = rol3;
                    5'b01010: present_state = and3;
                    5'b01011: present_state = or3;
                    5'b01100: present_state = addi3;
                    5'b01101: present_state = andi3;
                    5'b01110: present_state = ori3;
                    5'b01111: present_state = mul3;
                    5'b10000: present_state = div3;
                    5'b10001: present_state = neg3;
                    5'b10010: present_state = not3;
                    5'b10011: present_state = br3;
                    5'b10100: present_state = jt3;
                    5'b10101: present_state = jal3;
                    5'b10110: present_state = in3;
                    5'b10111: present_state = out3;
                    5'b11000: present_state = mfhi3;
                    5'b11001: present_state = mflo3;
                    5'b11010: present_state = nop3;
                    5'b11011: present_state = halt3;
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
