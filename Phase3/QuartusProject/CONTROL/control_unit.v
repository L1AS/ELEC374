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
    
    // output [31:0] inPortDataIn,               	  // inputs??? NOT SURE IF NEED HERE
    output reg [4:0] alu_opcode,                          // ALU opcode

    input [31:0] IR,
    input clock, reset, stop, CONFF_out
    ); 

    reg fetch_buffer;

    initial begin
        Gra <= 0; Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0; BAout <= 0;
        PCout_en <= 0; IncPC <= 0; PC_en <= 0; IR_en <= 0;                      // PC and IR signals
        Yin <= 0; HIout <= 0; HIin <= 0; LOout <= 0; LOin <= 0;                      // datapath MUX signals
        Cout <= 0; Zhighout <= 0; Zlowout <= 0; Zin <= 0;                       // datapath MUX signals
        MDRout <= 0; MDRin <= 0; MARin <= 0;                               // Mem Data Interface signals
        memRead <= 0; memWrite <= 0;                                  // memory read enable and write enable signals
        inPort_en <= 0; outPort_en <= 0;                              // Input/Output signals
        inPortOut <= 0; jal_R15 <= 0;
        CONin <= 0; 
        clear <= 1; run <= 0;
        fetch_buffer = 0;
    end

    // State declaration
    parameter reset_state = 8'h00, fetch0 = 8'h01, fetch1 = 8'h02, fetch2 = 8'h03,
                ld3 = 8'h04, ld4 = 8'h05, ld5 = 8'h06, ld6 = 8'h07, ld7 = 8'h08,
                ldi3 = 8'h09, ldi4 = 8'h0A, ldi5 = 8'h0B,
                st3 = 8'h0C, st4 = 8'h0D, st5 = 8'h0E, st6 = 8'h0F, st7 = 8'h10,
                add3 = 8'h11, add4 = 8'h12, add5 = 8'h13,
                sub3 = 8'h14, sub4 = 8'h15, sub5 = 8'h16,
                shr3 = 8'h17, shr4 = 8'h18, shr5 = 8'h19,
                shra3 = 8'h1A, shra4 = 8'h1B, shra5 = 8'h1C,
                shl3 = 8'h1D, shl4 = 8'h1E, shl5 = 8'h1F,
                ror3 = 8'h20, ror4 = 8'h21, ror5 = 8'h22,
                rol3 = 8'h23, rol4 = 8'h24, rol5 = 8'h25,
                and3 = 8'h26, and4 = 8'h27, and5 = 8'h28,
                or3 = 8'h29, or4 = 8'h2A, or5 = 8'h2B,
                addi3 = 8'h2C, addi4 = 8'h2D, addi5 = 8'h2E,
                andi3 = 8'h2F, andi4 = 8'h30, andi5 = 8'h31,
                ori3 = 8'h32, ori4 = 8'h33, ori5 = 8'h34,
                mul3 = 8'h35, mul4 = 8'h36, mul5 = 8'h37, mul6 = 8'h38,
                div3 = 8'h39, div4 = 8'h3A, div5 = 8'h3B, div6 = 8'h3C,
                neg3 = 8'h3D, neg4 = 8'h3E, neg5 = 8'h3F,
                not3 = 8'h40, not4 = 8'h41, not5 = 8'h42,
                br3 = 8'h43, br4 = 8'h44, br5 = 8'h45, br6 = 8'h46, br7 = 8'h47,
                jr3 = 8'h48, jal3 = 8'h49, jal4 = 8'h4A,
                in3 = 8'h4B, out3 = 8'h4C,
                mfhi3 = 8'h4D, mflo3 = 8'h4E,
                nop3 = 8'h4F, halt3 = 8'h50;


    // Present state
    reg [7:0] present_state = reset_state; // Adjust the bit pattern based on the number of states

    // Finite State Machine; if clock or reset rising-edge
    always @(posedge clock, posedge reset) begin
        if (reset == 1'b1) begin
            present_state = reset_state;
        end else if (stop == 1'b1) begin
            present_state = halt3;
        end else if (fetch_buffer) begin
            case (IR[31:27]) // Instruction decoding based on the alu_opcodeto set the next state 
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
            fetch_buffer = 0;
        end else 
            case (present_state) 
                reset_state: present_state = fetch0;
                fetch0: present_state = fetch1;
                fetch1: present_state = fetch2;
                fetch2: fetch_buffer = 1; 

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
                
                ori3: present_state = ori4;
                ori4: present_state = ori5;
                ori5: present_state = reset_state;

                mul3: present_state = mul4;
                mul4: present_state = mul5;
                mul5: present_state = mul6;
                mul6: present_state = reset_state;

                div3: present_state = div4;
                div4: present_state = div5;
                div5: present_state = div6;
                div6: present_state = reset_state;

                neg3: present_state = neg4;
                neg4: present_state = reset_state;

                not3: present_state = not4;
                not4: present_state = reset_state;

                br3: present_state = br4;
                br4: present_state = br5;
                br5: present_state = br6;
                br6: present_state = br7;
                br7: present_state = reset_state;

                jr3: present_state = reset_state;

                jal3: present_state = jal4;
                jal4: present_state = reset_state;

                in3: present_state = reset_state;

                out3: present_state = reset_state;
                
                mfhi3: present_state = reset_state;
                
                mflo3: present_state = reset_state;
                
                nop3: present_state = reset_state;

                halt3: present_state = reset_state;
            endcase
    end

    // Perform actions based on the current state
    always @(present_state, CONFF_out) begin
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
             //=========================================================================================
            fetch0: begin 
                PCout_en <= 1; MARin <= 1; IncPC <= 1; Zin <= 1; // See if you need to de-assert these signals
            end
            fetch1: begin
                PCout_en <= 0; MARin <= 0; IncPC <= 0; Zin <= 0;
                Zlowout <= 1; PC_en <= 1; memRead <= 1; MDRin <= 1;	// PC incremented (taking value calculated in Z), read IR content from memory  
            end
            fetch2: begin
                Zlowout <= 0; PC_en <= 0; memRead <= 0; MDRin <= 0;
                MDRout <= 1; IR_en <= 1; // assert content from memory to IR
            end
            //=========================================================================================
            // TODO: Waiting on Confirmation
            ld3: begin
                MDRout <= 0; IR_en <= 0;
                Grb <= 1; BAout <= 1; Rout <= 1; Yin <= 1; // select register Rb by assert Grb and BAout signals, put the content of Rb in Y register
            end
            ld4: begin
                Grb <= 0; BAout <= 0; Rout <= 0; Yin <= 0;
                Cout <= 1; alu_opcode <= 5'b00011; Zin <= 1;  // assert Cout to high -> get Csignextended (immediate), alu_opcodefor ADD, assert output of addtion to Z register
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
            ldi3: begin
                MDRout <= 0; IR_en <= 0;
                Grb <= 1; BAout <= 1; Yin <= 1; // select register Rb by assert Grb and BAout signals, put the content of Rb in Y register
            end
            ldi4: begin
                Grb <= 0; BAout <= 0; Yin <= 0;
                Cout <= 1; alu_opcode <= 5'b00011; Zin <= 1; // assert Cout to high -> get Csignextended (immediate), alu_opcodefor ADD, assert output of addtion to Z register
            end
            ldi5: begin
                Cout <= 0;
                alu_opcode <= 5'b0; // assert default ALU_out
                Zin <= 0; 
                Zlowout <= 1; Gra <= 1; Rin <= 1;  // put content of Z register to Ra
            end
            //=========================================================================================
            st3: begin
                MDRout <= 0; IR_en <= 0;
                Grb <= 1; BAout <= 1; Yin <= 1; // select register Rb by assert Grb and BAout signals, put the content of Rb in Y register
            end
            st4: begin
                Grb <= 0; BAout <= 0; Yin <= 0;
                Cout <= 1; alu_opcode <= 5'b00011; Zin <= 1; // assert Cout to high -> get Csignextended (immediate), alu_opcodefor ADD, assert output of addtion to Z register
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
            add3: begin
                MDRout <= 0; IR_en <= 0;
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
            sub3: begin
                MDRout <= 0; IR_en <= 0;
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
            shr3: begin
                MDRout <= 0; IR_en <= 0;
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
            shra3: begin
                MDRout <= 0; IR_en <= 0;
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
            shl3: begin
                MDRout <= 0; IR_en <= 0;
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
            ror3: begin
                MDRout <= 0; IR_en <= 0;
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
            rol3: begin
                MDRout <= 0; IR_en <= 0;
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
            and3: begin
                MDRout <= 0; IR_en <= 0;
                Grb <= 1; Rout <= 1; Yin <= 1;
            end
            and4: begin
                Grb <= 0; Yin <= 0;
                Grc <= 1; alu_opcode <= 5'b01010; Zin <= 1; 
            end
            and5: begin
                Grc <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
                Zlowout <= 1; Gra <= 1; Rin <= 1;
            end
            //=========================================================================================
            or3: begin
                MDRout <= 0; IR_en <= 0;
                Grb <= 1; Rout <= 1; Yin <= 1;
            end
            or4: begin
                Grb <= 0; Yin <= 0;
                Grc <= 1; alu_opcode <= 5'b01011; Zin <= 1;             
            end
            or5: begin
                Grc <= 0; Rout <= 0; alu_opcode <= 5'b0; Zin <= 0; 
                Zlowout <= 1; Gra <= 1; Rin <= 1;
            end
            //=========================================================================================
            addi3: begin
                MDRout <= 0; IR_en <= 0;
                Grb <= 1; Rout <= 1; Yin <= 1;  // select register Rb by assert Grb and Rout signals, put the content of Rb in Y register
            end
            addi4: begin
                Grb <= 0; Rout <= 0; Yin <= 0;
                Cout <= 1; alu_opcode <= 5'b00011; Zin <= 1; // assert Cout to high -> get Csignextended (immediate), alu_opcodefor ADDi(00011), ANDi(01010), and ORi(01011), assert output of arithmetic operation to Z register
            end
            addi5: begin
                Cout <= 0; Zin <= 0; 
                alu_opcode <= 5'b0; //assert default
                Zlowout <= 1; Gra <= 1; Rin <= 1; // put the content of Z register to Ra  
            end
            //=========================================================================================
            andi3: begin
                MDRout <= 0; IR_en <= 0;
                Grb <= 1; Rout <= 1; Yin <= 1;  // select register Rb by assert Grb and Rout signals, put the content of Rb in Y register
            end
            andi4: begin
                Grb <= 0; Rout <= 0; Yin <= 0;
                Cout <= 1; alu_opcode <= 5'b01010; Zin <= 1; // assert Cout to high -> get Csignextended (immediate), alu_opcodefor ADDi(00011), ANDi(01010), and ORi(01011), assert output of arithmetic operation to Z register
            end
            andi5: begin
                Cout <= 0; Zin <= 0; 
                alu_opcode <= 5'b0; //assert default
                Zlowout <= 1; Gra <= 1; Rin <= 1; // put the content of Z register to Ra  
            end
            //=========================================================================================
            ori3: begin
                MDRout <= 0; IR_en <= 0;
                Grb <= 1; Rout <= 1; Yin <= 1;  // select register Rb by assert Gra and Rout signals, put the content of Rb in Y register
            end
            ori4: begin
                Grb <= 0; Rout <= 0; Yin <= 0;
                Cout <= 1; alu_opcode <= 5'b01011; Zin <= 1; // assert Cout to high -> get Csignextended (immediate), alu_opcodefor ADDi(00011), ANDi(01010), and ORi(01011), assert output of arithmetic operation to Z register
            end
            ori5: begin
                Cout <= 0; Zin <= 0; 
                alu_opcode <= 5'b0; //assert default
                Zlowout <= 1; Gra <= 1; Rin <= 1; // put the content of Z register to Ra  
            end
            //=========================================================================================
            mul3: begin
                MDRout <= 0; IR_en <= 0;
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
            //=========================================================================================
            div3: begin
                MDRout <= 0; IR_en <= 0;
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
            //=========================================================================================
            neg3: begin
                MDRout <= 0; IR_en <= 0;
                Grb <= 1; Rout <= 1; alu_opcode <= 5'b10001; Zin <= 1;
            end
            neg4: begin
                Grb <= 0; Rout <= 0; Zin <= 0;
                Zlowout <= 1; Gra <= 1; Rin <= 1;
            end
            //=========================================================================================
            not3: begin
                MDRout <= 0; IR_en <= 0;
                Grb <= 1; Rout <= 1; alu_opcode <= 5'b10010; Zin <= 1;
            end
            not4: begin
                Grb <= 0; Rout <= 0; Zin <= 0;
                Zlowout <= 1; Gra <= 1; Rin <= 1;
            end
            //=========================================================================================
            br3: begin
                MDRout <= 0; IR_en <= 0;
            end
            br4: begin
                Gra <= 1; Rout <= 1; CONin <= 1;
            end
            br5: begin
                Gra <= 0; Rout <= 0; CONin <= 0; 
                PCout_en <= 1; Yin <= 1;
            end
            br6: begin
                PCout_en <= 0; Yin <= 0; 
                Cout <= 1; alu_opcode<= 5'b00011; Zin <= 1;
            end
            br7: begin
                Cout <= 0; alu_opcode <= 5'b0; Zin <= 1;
                Zlowout <= 1; PC_en <= CONFF_out;
            end
            //=========================================================================================
            // TODO: Waiting on Confirmation
            jr3: begin
                MDRout <= 0; IR_en <= 0;
                Gra <= 1; Rout <= 1; PC_en <= 1;
            end
            //=========================================================================================
            jal3: begin
                MDRout <= 0; IR_en <= 0;
                PCout_en <= 1; jal_R15 <= 1;   
            end
            jal4: begin
                PCout_en <= 0; jal_R15 <= 0;
                Gra <= 1; Rout <= 1; PC_en <= 1;
            end
            //=========================================================================================
            // TODO: Waiting on Confirmation
            in3: begin
                MDRout <= 0; IR_en <= 0;
                Gra <= 1; Rin <= 1; inPortOut <= 1;
            end
            //=========================================================================================
            // TODO: Waiting on Confirmation
            out3: begin
                MDRout <= 0; IR_en <= 0;
                Gra <= 1; Rout <= 1; outPort_en <= 1;
            end
            //=========================================================================================
            mfhi3: begin
                MDRout <= 0; IR_en <= 0;
                Gra <= 1; Rin <= 1; HIout <= 1;
            end
            //=========================================================================================
            mflo3: begin
                MDRout <= 0; IR_en <= 0;
                Gra <= 1; Rin <= 1; LOout <= 1;
            end
            //=========================================================================================
            nop3: begin
                MDRout <= 0; IR_en <= 0;
            end
            //=========================================================================================
            halt3: begin
                MDRout <= 0; IR_en <= 0;
                run <= 0;
            end
        endcase
    end

endmodule
