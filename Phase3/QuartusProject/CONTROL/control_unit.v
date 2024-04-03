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
            ld4: present_state = ld5;
            ld5: present_state = ld6;
            ld6: present_state = ld7;
            ld7: present_state = reset_state;
            
            ldi3: present_state = ldi4;
            ldi4: present_state = ldi5;
            ldi5: present_state = reset_state;
            
            st3: present_state = st4;
            st4: present_state = st5;
            st5: present_state = st6;
            st6: present_state = st7;
            st7: present_state = reset_state;
            
            add3: present_state = add4;
            add4: present_state = add5;
            add5: present_state = reset_state;
            
            sub3: present_state = sub4;
            sub4: present_state = sub5;
            sub5: present_state = reset_state;
            
            shr3: present_state = shr4;
            shr4: present_state = shr5;
            shr5: present_state = reset_state;
            
            shra3: present_state = shra4;
            shra4: present_state = shra5;
            shra5: present_state = reset_state;
            
            shl3: present_state = shl4;
            shl4: present_state = shl5;
            shl5: present_state = reset_state;
            
            ror3: present_state = ror4;
            ror4: present_state = ror5;
            ror5: present_state = reset_state;

            rol3: present_state = rol4;
            rol4: present_state = rol5;
            rol5: present_state = reset_state;

            and3: present_state = and4;
            and4: present_state = and5;
            and5: present_state = reset_state;
            
            or3: present_state = or4;
            or4: present_state = or5;
            or5: present_state = reset_state;

            addi3: present_state = addi4;
            addi4: present_state = addi5;
            addi5: present_state = reset_state;

            andi3: present_state = andi4;
            andi4: present_state = andi5;
            andi5: present_state = reset_state;
            
            ori3: present_state = ori3;
            ori3: present_state = reset_state;

            mul3: present_state = mul4;
            mul4: present_state = mul5;
            mul5: present_state = mul6;
            mul6: present_state = reset_state;

            div3: prepare_state = div4;
            div4: prepare_state = div5;
            div5: prepare_state = div6;
            div6: present_state = reset_state;

            neg3: present_state = neg4;
            neg4: present_state = reset_state;

            not3: present_state = not4;
            not4: present_state = reset_state;

            br3: present_state = br4;
            br4: present_state = reset_state;

            jr3: present_state = jr4;
            jr4: present_state = reset_state;

            jal3: present_state = jal4;
            jal4: present_state = reset_state;

            in3: present_state = in4;
            in4: present_state = reset_state;
            
            out3: present_state = out4;
            out4: present_state = reset_state;
            
            mfhi3: present_state = mfhi4;
            mfhi4: present_state = reset_state;
            
            mflo3: present_state = mflo4;
            mflo4: present_state = reset_state;
            
            nop3: present_state = reset_state;

            halt3: present_state = reset_state;
        endcase
end

// Perform actions based on the current state
always @(present_state) 
begin
    case (present_state) // Assert the required signals in each state
        reset_state: begin
            Gra <= 0; Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0; BAout <= 0;
            PCout_en <= 0; IncPC <= 0; PC_en <= 0; IR_en <= 0;                      // PC and IR signals
            Yin <= 0; HIout <= 0; HIin <= 0; LOout <= 0; LOin <= 0;                      // datapath MUX signals
            Cout <= 0; Zhighout <= 0; Zlowout <= 0; Zin <= 0;                       // datapath MUX signals
            MDRout <= 0; MDRin <= 0; MARin <= 0;                               // Mem Data Interface signals
            memRead <= 0; memWrite <= 0;                                  // memory read enable and write enable signals
            inPort_en <= 0; outPort_en <= 0;                              // Input/Output signals
            inPortOut <= 0; jal_R15 <= 0;
            CONin <= 0; 
            clear <= 0; run <= 0;
        end
        // TODO: Waiting on Confirmation
        fetch0: begin 
            PCout_en <= 1; MARin <= 1; IncPC <= 1; Zin <= 1; // See if you need to de-assert these signals
        end
        fetch1: begin
            PCout_en <= 0; MARin <= 0; IncPC <= 0; Zin <= 0;
            Zlowout <= 1; PC_en <= 1; memRead <= 1; MDRin <= 1;	// PC incremented (taking value calculated in Z), read IR content from memory  
        end
        fetch2: begin
            Zlowout <= 0; PC_en <= 0; memRead <= 0; MDRin <= 0;
            MDRout <= 1; IRin <= 1; // assert content from memory to IR
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        ld3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; BAout <= 1; Rout <= 1; Yin <= 1; // select register Rb by assert Grb and BAout signals, put the content of Rb in Y register
        end
        ld4: begin
            Grb <= 0; BAout <= 0; Rout <= 0; Yin <= 0;
            Cout <= 1; alu_opcode <= 5'b00011; Zin <= 1;  // assert Cout to high -> get Csignextended (immediate), opcode for ADD, assert output of addtion to Z register
        end
        ld5: begin
            Cout <= 0;
            alu_opcode <= 5'b0; // assert default ALU_out
            Zin <= 0; 
            Zlowout <= 1; MARin <= 1;  // get the result (new address by adding content in Rb and the immediate) in Z register, assert MARin to move the address to the MAR
        end
        ld6: begin
            Zlowout <= 0; MARin <= 0; 
            memRead <= 1; MDRin <= 1; // read the content in the new address, put the content to MDR
        end
        ld7: begin
            memRead <= 0; MDRin <= 0;
            MDRout <= 1; Gra <= 1; Rin <= 1; 
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        ldi3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; BAout <= 1; Yin <= 1; // select register Rb by assert Grb and BAout signals, put the content of Rb in Y register
        end
        ldi4: begin
            Grb <= 0; BAout <= 0; Yin <= 0;
            Cout <= 1; alu_opcode <= 5'b00011; Zin <= 1; // assert Cout to high -> get Csignextended (immediate), opcode for ADD, assert output of addtion to Z register
        end
        ldi5: begin
            Cout <= 0;
		    alu_opcode <= 5'b0; // assert default ALU_out
			Zin <= 0; 
            Zlowout <= 1; Gra <= 1; Rin <= 1;  // put content of Z register to Ra
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        st3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; BAout <= 1; Yin <= 1; // select register Rb by assert Grb and BAout signals, put the content of Rb in Y register
        end
        st4: begin
            Grb <= 0; BAout <= 0; Yin <= 0;
            Cout <= 1; alu_opcode <= 5'b00011; Zin <= 1; // assert Cout to high -> get Csignextended (immediate), opcode for ADD, assert output of addtion to Z register
        end
        st5: begin
            Cout <= 0;
            alu_opcode <= 5'b0; // assert default ALU_out
            Zin <= 0; 
            Zlowout <= 1; MARin <= 1;  // get the result (new address by adding content in Rb and the immediate) in Z register, assert MARin to move the address to the MAR
        end
        st6: begin
            Zlowout <= 0; MARin <= 0; 
            Gra <= 1; Rout <= 1; MDRin <= 1; // write the contents in Ra, to the address in MDR
        end
        st7: begin
            Gra <= 0; Rout <= 0; MDRin <= 0;
            memWrite <= 1;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        add3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; Yin <= 1;
        end
        add4: begin
            Grb <= 0; Yin <= 0;
            Grc <= 1; alu_opcode <= 5'b00011; Zin <= 1; 
        end
        add5: begin
            Grc <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
            Zlowout <= 1; Gra <= 1; Rin <= 1;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        sub3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; Yin <= 1;
        end
        sub4: begin
            Grb <= 0; Yin <= 0;
            Grc <= 1; alu_opcode <= 5'b00100; Zin <= 1; 
        end
        sub5: begin
            Grc <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
            Zlowout <= 1; Gra <= 1; Rin <= 1;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        shr3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; Yin <= 1;
        end
        shr4: begin
            Grb <= 0; Yin <= 0;
            Grc <= 1; alu_opcode <= 5'b00101; Zin <= 1; 
        end
        shr5: begin
            Grc <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
            Zlowout <= 1; Gra <= 1; Rin <= 1;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        shra3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; Yin <= 1;
        end
        shra4: begin
            Grb <= 0; Yin <= 0;
            Grc <= 1; alu_opcode <= 5'b00110; Zin <= 1; 
        end
        shra5: begin
            Grc <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
            Zlowout <= 1; Gra <= 1; Rin <= 1;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        shl3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; Yin <= 1;
        end
        shl4: begin
            Grb <= 0; Yin <= 0;
            Grc <= 1; alu_opcode <= 5'b00111; Zin <= 1; 
        end
        shl5: begin
            Grc <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
            Zlowout <= 1; Gra <= 1; Rin <= 1;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        ror3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; Yin <= 1;
        end
        ror4: begin
            Grb <= 0; Yin <= 0;
            Grc <= 1; alu_opcode <= 5'b01000; Zin <= 1; 
        end
        ror5: begin
            Grc <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
            Zlowout <= 1; Gra <= 1; Rin <= 1;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        rol3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; Yin <= 1;
        end
        rol4: begin
            Grb <= 0; Yin <= 0;
            Grc <= 1; alu_opcode <= 5'b01001; Zin <= 1; 
        end
        rol5: begin
            Grc <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
            Zlowout <= 1; Gra <= 1; Rin <= 1;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        and3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; Yin <= 1;
        end
        and4: begin
            Grb <= 0; Yin <= 0;
            Grc <= 1; alu_opcode <= 5'b01010; Zin <= 1; 
        end
        and5: begin
            Grc <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
            Zlowout <= 1; Gra <= 1; Rin <= 1
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        or3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; Yin <= 1;
        end
        or4: begin
            Grb <= 0; Yin <= 0;
            Grc <= 1; alu_opcode <= 5'b01011; Zin <= 1;             
        end
        or5: begin
            Grc <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
            Zlowout <= 1; Gra <= 1; Rin <= 1
        end
        //=========================================================================================
        addi3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; Yin <= 1;  // select register Rb by assert Grb and Rout signals, put the content of Rb in Y register
        end
        addi4: begin
            Grb <= 0; Rout <= 0; Yin <= 0;
            Cout <= 1; alu_opcode <= 5'b00011; Zin <= 1; // assert Cout to high -> get Csignextended (immediate), opcode for ADDi(00011), ANDi(01010), and ORi(01011), assert output of arithmetic operation to Z register
        end
        addi5: begin
            Cout <= 0; Zin <= 0; 
			alu_opcode <= 5'b0; //assert default
            Zlowout <= 1; Gra <= 1; Rin <= 1; // put the content of Z register to Ra  
        end
        //=========================================================================================
        andi3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; Yin <= 1;  // select register Rb by assert Grb and Rout signals, put the content of Rb in Y register
        end
        andi4: begin
            Grb <= 0; Rout <= 0; Yin <= 0;
            Cout <= 1; alu_opcode <= 5'b01010; Zin <= 1; // assert Cout to high -> get Csignextended (immediate), opcode for ADDi(00011), ANDi(01010), and ORi(01011), assert output of arithmetic operation to Z register
        end
        andi5: begin
            Cout <= 0; Zin <= 0; 
			alu_opcode <= 5'b0; //assert default
            Zlowout <= 1; Gra <= 1; Rin <= 1; // put the content of Z register to Ra  
        end
        //=========================================================================================
        ori3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; Yin <= 1;  // select register Rb by assert Gra and Rout signals, put the content of Rb in Y register
        end
        ori4: begin
            Grb <= 0; Rout <= 0; Yin <= 0;
            Cout <= 1; alu_opcode <= 5'b01011; Zin <= 1; // assert Cout to high -> get Csignextended (immediate), opcode for ADDi(00011), ANDi(01010), and ORi(01011), assert output of arithmetic operation to Z register
        end
        ori5: begin
            Cout <= 0; Zin <= 0; 
			alu_opcode <= 5'b0; //assert default
            Zlowout <= 1; Gra <= 1; Rin <= 1; // put the content of Z register to Ra  
        end
        // TODO: waiting on Confirmation
        //=========================================================================================
        mul3: begin
            MDRout <= 0; IRin <= 0;
            Gra <= 1; Rout <= 1; Yin <= 1;  // select register Ra by assert Gra and Rout signals, put the content of Ra in Y register
        end
        mul4: begin
            Gra <= 0; Yin <= 0;
            Grb <= 1; alu_opcode <= 5'b01111; Zin <= 1;   
        end
        mul5: begin 
            Grb <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
            Zlowout <= 1; LOin <= 1;
        end
        mul6: begin
            Zlowout <= 0; LOin <= 0;
            Zhighout <= 1; HIin <= 1;
        end
        // TODO: waiting on Confirmation
        //=========================================================================================
        div3: begin
            MDRout <= 0; IRin <= 0;
            Gra <= 1; Rout <= 1; Yin <= 1;  // select register Ra by assert Gra and Rout signals, put the content of Ra in Y register
        end
        div4: begin
            Gra <= 0; Yin <= 0;
            Grb <= 1; alu_opcode <= 5'b10000; Zin <= 1;   
        end
        div5: begin 
            Grb <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
            Zlowout <= 1; LOin <= 1;
        end
        div6: begin
            Zlowout <= 0; LOin <= 0;
            Zhighout <= 1; HIin <= 1;
        end
        // TODO: waiting on Confirmation
        //=========================================================================================
        neg3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; alu_opcode <= 5'b10001; Zin <= 1;
        end
        neg4: begin
            Grb <= 0; Zin <= 0;
            Zlowout <= 1; Gra <= 1; Rin <= 1;
        end
        // TODO: waiting on Confirmation
        //=========================================================================================
        not3: begin
            MDRout <= 0; IRin <= 0;
            Grb <= 1; Rout <= 1; alu_opcode <= 5'b10010; Zin <= 1;
        end
        not4: begin
            Grb <= 0; Zin <= 0;
            Zlowout <= 1; Gra <= 1; Rin <= 1;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        br3: begin
            MDRout <= 0; IRin <= 0;
            Gra <= 1; Rout <= 1; CONin <= 1;
        end
        br4: begin
            Gra <= 0; Rout <= 0; CONin <= 0; 
            PCout_en <= 1; Yin <= 1;
        end
        br5: begin
            PCout_en <= 0; Yin <= 0; 
            Cout <= 1; opcode <= 5'b00011; Zin <= 1;
        end
        br6: begin
            Cout <= 0; opcode <= 5'b11010; Zin <= 1;
            Zlowout <= 1; PC_en <= CONFF_out;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        jr3: begin
            MDRout <= 0; IRin <= 0;
            Rout <= 1; PC_en <= 1;
        end
        jr4: begin
            Gra <= 0; Rout <= 0; PC_en <= 0;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        jal3: begin
            MDRout <= 0; IRin <= 0;
            PCout_en <= 1; jal_R15 <= 1;   
        end
        jal4: begin
            PCout_en <= 0; jal_R15 <= 0;
            Gra <= 1; Rout <= 1; PC_en <= 1;
        end
        jal5: begin
            Gra <= 0; Rout <= 0; PC_en <= 0;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        in3: begin
            MDRout <= 0; IRin <= 0;
            Gra <= 1; Rin <= 1; inPortOut <= 1;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        out3: begin
            MDRout <= 0; IRin <= 0;
            Gra <= 1; Rout <= 1; outPort_en <= 1;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        mfhi3: begin
            MDRout <= 0; IRin <= 0;
            Gra <= 1; Rin <= 1; HIout <= 1;
        end
        //=========================================================================================
        // TODO: Waiting on Confirmation
        mflo3: begin
            MDRout <= 0; IRin <= 0;
            Gra <= 1; Rin <= 1; LOout <= 1;
        end
        //=========================================================================================
        nop3: begin
            MDRout <= 0; IRin <= 0;
        end
        //=========================================================================================
        halt3: begin
            MDRout <= 0; IRin <= 0;
            run <= 0;
        end
    endcase
end

endmodule
