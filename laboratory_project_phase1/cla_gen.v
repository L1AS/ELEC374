module cla_gen#(parameter = WIDTH)(
    input [WIDTH-1:0] in_A, in_B,
    input Cin,  // carry in
    output [WIDTH-1:0] out_Sum,
);

wire [WIDTH:0] wire_C; // carry intermediate
wire [WIDTH-1:0] wire_G, wire_P, wire_SUM; // carry generate, carry propagate, sum

// full adder, consider use generate function in verilog
gen var i;
generate
    for (i = 0, i < WIDTH, i = i + 1) 
    begin
        full_adder full_adder_i (
            .in_A (in_A[i]),
            .in_B (in_B[i]),
            .Cin (wire_C[i]),
            .out_Sum (wire_SUM[i])
            .Cout()
        );
    end
endgenerate

assign wire_C[0] = 1'b0;
// Generate Terms G = A * B (a.k.a A AND B)
// P = A XOR B or A OR B
generate
    for (j = 0, j < WIDTH, j = j + 1)
    begin
        assign wire_G[j] = in_A[j] & in_B[j];
        assign wire_P[j] = in_A[j] ^ in_B[j];
        assign wire_C[j+1] = wire_G[j] | (wire_P[j] & wire_C[j]);    
    end
endgenerate

// Concatenation
assign out_Sum = {wire_C[WIDTH], wire_SUM};