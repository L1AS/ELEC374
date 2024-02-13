module neg_op (
  input wire[31:0] B_reg,
  output wire[31:0] neg_out
);
  reg[31:0] temp;
  always@(*) begin
    temp = B_reg;
    not_op not(B_reg, temp);
    add_op add(32'd1, temp, temp);
  end
  assign neg_out = temp;
endmodule