module con_ff (
    output conff_out,
    input CONin,
    input [31:0] IR, BusMuxOut
);

wire w1, w2, w3, w4;

reg con_data;

reg [3:0] branch_condition;

case (IR[22:19])
    4'b0000: branch_condition[0] <= 1'b1; // branch if zero
    4'b0001: branch_condition[1] <= 1'b1; // bracnh if nonzero
    4'b0010: branch_condition[2] <= 1'b1; // branch if positive
    4'b0011: branch_condition[3] <= 1'b1; // branch if negative
endcase

assign w1 = branch_condition[0] & ^BusMuxOut;
assign w2 = branch_condition[1] & !(^BusMuxOut);
assign w3 = branch_condition[2] & !BusMuxOut[31];
assign w4 = branch_condition[3] & BusMuxOut[31];

con_data = w1 | w2 | w3 | w4;

flip_flop CON (.Q(conff_out), .D(con_data), .clk(CONin));

endmodule