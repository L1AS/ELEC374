// Ripple Carry Adder
module adder(A, B, Result);

input [7:0] A, B;
output [7:0] Result;

reg [7:0] Result;
reg [8:0] LocalCarry;

integer i;

always@(A or B)
  begin
    LocalCarry = 9'd0;
    for (i = 0; i < 8; i = i + 1)
    begin
      Result[i] = A[i]^B[i]^LocalCarry[i];
      LocalCarry[i+1] = (A[i]&B[i]) | (LocalCarry[i]&(A[i]|B[i]));
    end
  end
endmodule