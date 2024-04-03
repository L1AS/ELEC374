module flip_flop(
    output wire Q,
    input D, clk 
);	
    reg q_internal;
    initial q_internal = 1'b0;

    always@(posedge clk) 
    begin
        q_internal <= D;
    end
    assign Q = q_internal;
endmodule
