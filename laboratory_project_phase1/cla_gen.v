module cla_gen#(parameter = WIDTH)(
    input [WIDTH-1:0] in_A, in_B,
    input Cin,  // carry in
    output [WIDTH-1:0] out_Sum,
);

wire [WIDTH:0] wire_C; // carry intermediate
wire [WIDTH-1:0] wire_G, wire_P, w_SUM; // carry generate, carry propagate, sum

// full adder, consider use generate function in verilog
gen var i;
generate
    for (i = 0, i < WIDTH, i = i + 1) 
    begin
        full_adder full_adder_i (
            .in_A (in_A[i]),
            .in_B (in_B[i]),
            .Cin (wire_C[i]),
            .out_Sum (w_SUM[i])
            .Cout()
        );
    end
// Generate Terms G = A * B (a.k.a A AND B)
assign G = in_A & in_B; 
// P = A XOR B
