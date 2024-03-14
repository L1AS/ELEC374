module select_encode (
    output[15:0] reg_in, reg_out
    input Gra, Grb, Grc, Rin, Rout, BAout,
    input [31:0] IR
);
    reg [15:0] reg_select;
    reg [3:0] w1, w2, w3;
	wire [3:0] w4;
    wire Rout_base_address_checked;
   
    assign Rout_base_address_checked = BAout | Rout;
    always @ (*) begin
        w1 <= IR[26:23] & {4{Gra}};
        w2 <= IR[22:19] & {4{Grb}};
        w3 <= IR[18:15] & {4{Grc}};
    end

    assign w4 = w1 | w2 | w3; // need better naming

    // use 4_to_16 decoder here
    decoder_4_to_16 decoder_4_to_16_i(.decodedOutput(reg_select), .decoderInput(w4));

    assign reg_in = Rin & reg_select;
    assign reg_out = Rout_base_address_checked & reg_select;
endmodule