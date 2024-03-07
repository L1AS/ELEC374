module sub_op#(parameter WIDTH = 32)(
<<<<<<< HEAD
    input signed [WIDTH-1:0] in_term1, in_term2,
    output signed [WIDTH-1:0] out_difference
);
    // store negative of in_term2
    wire signed [WIDTH-1:0] neg_in_term2;
    // generate negative of in_term2
    assign neg_in_term2 = ~in_term2 + 1;
    // Use carry lookahead adder to perform substraction
    add_op substract_i (
        .in_add1 (in_term1),
        .in_add2 (neg_in_term2),
        .Cin(1'b0),
        .out_Sum (out_difference)
=======
    output signed [WIDTH-1:0] sub_out,
    input signed [WIDTH-1:0] A_reg, B_reg
);
    // store negative of B_reg
    wire signed [WIDTH-1:0] neg_B_reg;
    // generate negative of B_reg
    assign neg_B_reg = ~B_reg + 1;
    // Use carry lookahead adder to perform substraction
    add_op substract_i (
        .add_out (sub_out),
        .A_reg (A_reg),
        .B_reg (neg_B_reg),
        .Cin(1'b0)
>>>>>>> main
    );
endmodule