module con_ff (
    output conff_out,  // might need to be register
    input wire CONin,
    input [31:0] IRout, busMuxOut
);

    wire w1, w2, w3, w4;

    wire con_data;

    reg [3:0] branch_condition;

    always @ (IRout) begin
        case (IRout[22:19])
            4'b0000: branch_condition <= 4'b0001; // branch if zero
            4'b0001: branch_condition <= 4'b0010; // branch if nonzero
            4'b0010: branch_condition <= 4'b0100; // branch if positive
            4'b0011: branch_condition <= 4'b1000; // branch if negative
			default: branch_condition <= 4'b0000;
        endcase
    end

    assign w1 = branch_condition[0] & (~|busMuxOut);
    assign w2 = branch_condition[1] & (| busMuxOut);
    assign w3 = branch_condition[2] & (!busMuxOut[31]);
    assign w4 = branch_condition[3] & busMuxOut[31];

    assign con_data = w1 | w2 | w3 | w4;

    flip_flop CON (.Q(conff_out), .D(con_data), .clk(CONin));

endmodule