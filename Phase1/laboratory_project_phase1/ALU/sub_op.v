module sub_op#(parameter WIDTH = 32)(
    input signed [WIDTH-1:0] A_reg, B_reg,
    output signed [WIDTH-1:0] sub_out
);
    // store negative of B_reg
    wire signed [WIDTH-1:0] neg_B_reg;
    // generate negative of B_reg
    assign neg_B_reg = ~B_reg + 1;
    // Use carry lookahead adder to perform substraction
    add_op substract_i (
        .A_reg (A_reg),
        .B_reg (neg_B_reg),
        .Cin(1'b0),
        .add_out (sub_out)
    );
endmodule