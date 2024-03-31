module b_cell (
<<<<<<< HEAD
    input in_A, in_B, Cin, 
    output out_Sum, Cout
);

wire w1, w2, w3;

assign w1 = in_A ^ in_B; // in_A XOR in_B
assign w2 = w1 & Cin; // w1 AND carry in (equivalent to (in_A XOR in_B) AND Cin)
assign w3 = in_A & in_B; // in_A AND in_B

assign out_Sum = w1 ^ Cin; // equivalent to in_A XOR in_B XOR Cin
assign Cout = w2 | w3;
=======
    output out_Propagate, out_Generate, out_Sum, Cout,
    input in_A, in_B, Cin
);

assign out_Propagate = in_A ^ in_B; // Propogate Terms P = A XOR B or A OR B 
assign out_Generate = in_A & in_B; // Generate Terms G = A * B (a.k.a A AND B)
assign out_Sum = out_Propagate ^ Cin; // equivalent to in_A XOR in_B XOR Cin
assign Cout = out_Generate | out_Propagate & Cin; // Ci+1 = Gi OR PiCi
>>>>>>> main

endmodule