module flip_flop(
    output wire Q, Q_not,
    input D, clk 
);	
    reg q_internal;
    initial q_internal = 1'b0;

    always@(posedge clk) 
    begin
        q_internal <= D;
    end
    assign Q = q_internal;
    assign Q_not = !q_internal;
endmodule
