module comb #(
   
) (
    output F,
    input WO, W1, S,
    wire S1, S2, S3
);
    or(F, S2, S3);
    and(S2, WO, S1);
    and(S3, S, W1);
    not(S1, S);
endmodule