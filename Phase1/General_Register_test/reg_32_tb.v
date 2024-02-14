
`timescale 1ns / 10ps

module register_32_tb();
    reg clockin, clearin, enablein;
    reg [31:0] datain;
    reg [31:0] dataout;

    register_gen #(.WIDTH(32)) DUT(
						   .clear(clearin), 
                    .clock(clockin), 
                    .enable(enablein),
                    .BusMuxOut(datain),
                    .BusMuxIn(dataout));

    parameter Default = 4'd0;
    parameter s_clear = 4'd1;
    parameter write_1 = 4'd2;
    parameter write_2 = 4'd3;
	 
	 reg [3:0] present_state = Default;

    initial begin clockin = 0; end
    always #10 clockin = ~clockin;
    always @(negedge clockin) present_state = present_state + 1;

    always @(present_state) begin
        case (present_state)
            default: begin
                clearin = 1;
                datain = 8'h0;
                enablein = 0;
                #10 enablein = 0;
                #10 clearin = 0;
            end
            s_clear: begin
                clearin = 1;
                #10 clearin = 0;
                datain = 'h11111111;
                enablein = 1;
                #10 enablein = 0;
            end
            write_1: begin
                clearin = 1;
                #10 clearin = 0;
                datain = 'h72934834;
                enablein = 1;
                #10 enablein = 0;
            end
        endcase
		end
endmodule