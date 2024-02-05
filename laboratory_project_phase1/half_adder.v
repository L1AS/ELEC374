module half_adder( 
  input a, b,
  output sum,carry_out
);
// gate level design of half adder  
  xor x1(sum, a, b);
  and a1(carry_out,a, b);
endmodule