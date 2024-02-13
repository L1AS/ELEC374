module sub_op#(parameter WIDTH = 32)(
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
        .out_Sum (out_difference)
    );
endmodule