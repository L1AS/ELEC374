module b_cell (
    output out_Propagate, out_Generate, out_Sum, Cout,
    input in_A, in_B, Cin
);

assign out_Propagate = in_A ^ in_B; // Propogate Terms P = A XOR B or A OR B 
assign out_Generate = in_A & in_B; // Generate Terms G = A * B (a.k.a A AND B)
assign out_Sum = out_Propagate ^ Cin; // equivalent to in_A XOR in_B XOR Cin
assign Cout = out_Generate | out_Propagate & Cin; // Ci+1 = Gi OR PiCi

endmodule