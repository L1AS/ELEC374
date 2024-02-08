module half_adder( 
  input in_A, in_B,
  output out_Sum, Cout
);
// S = A XOR B
xor x1(out_Sum, in_A, in_B);
// C = A AND B
and a1(Cout, in_A, in_B);
endmodule