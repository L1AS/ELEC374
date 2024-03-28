module select_encode (
    output[15:0] reg_in, reg_out,
    // output [4:0] opcode_IR,
    input Gra, Grb, Grc, Rin, Rout, BAout,
    input [31:0] IR
);
    wire [15:0] reg_select;
    // reg [4:0] opcode_IR_interm
    reg [3:0] w1, w2, w3;
	wire [3:0] w4;
    wire Rout_base_address_checked;
   
    assign Rout_base_address_checked = BAout | Rout;
    always @ (*) begin
        // opcode_IR_interm <= IR[31:27];
        w1 <= IR[26:23] & {4{Gra}};
        w2 <= IR[22:19] & {4{Grb}};
        w3 <= IR[18:15] & {4{Grc}};
    end

    assign w4 = w1 | w2 | w3; // need better naming

    // use 4_to_16 decoder here
    decoder_4_to_16 decoder_4_to_16_i(.decodedOutput(reg_select), .decoderInput(w4));

    // assign opcode_IR = opcode_IR_interm[4:0];
    assign reg_in = {15{Rin}} & reg_select;
    assign reg_out = {15{Rout_base_address_checked}} & reg_select;
endmodule