module FSM  (
    output reg z,
    input K, L, Reset, clk
    
);

    reg[2:0] present_state, next_state;    // 6 states
    parameter S0 = 3'b0, S1 = 3'd1, S2 = 3'd2, 
                S3 = 3'd3, S4 = 3'd4, S5 = 3'b5; 

    always@(posedge clk, Reset) begin
        if(Reset == 1)
            present_state <= S0;
        else
            present_state <= next_state;
    end
    always@(present_state, K, L) begin
        case(present_state)
            S0:begin
                Z <= 0;
                if (k == 1) next_state <= S1;
                else if(L == 1) next_state <= S2;
                else next_state <= S0;
            end
            S1:begin
                Z <= 0;
                if(k == 1) next_state <= S1;
                else if(L == 0) next_state = S3; //both K = 0 and L = 0
            end

            S2:
            
            S3:

            S4:

            S5:
        endcase
    end

    
endmodule