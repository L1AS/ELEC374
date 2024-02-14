module b_cell (
    input in_A, in_B, Cin, 
    output out_Sum, Cout
);

wire w1, w2, w3;

assign w1 = in_A ^ in_B; // in_A XOR in_B
assign w2 = w1 & Cin; // w1 AND carry in (equivalent to (in_A XOR in_B) AND Cin)
assign w3 = in_A & in_B; // in_A AND in_B

assign out_Sum = w1 ^ Cin; // equivalent to in_A XOR in_B XOR Cin
assign Cout = w2 | w3;

endmodule