// 32-bit register
module register #(parameter DATA_WIDTH_IN = 32, DATA_WIDTH_OUT = 32, INIT = 32'b0)(
    input clr, clk, enable, 
    input [DATA_WIDTH_IN-1:0] BusMuxOut, 
    output wire [DATA_WIDTH_OUT-1:0] BusMuxIn
); 
reg [DATA_WIDTH_IN-1:0] Q; 
initial Q = INIT;
// rising edge trigger
always @ (posedge clk)
        begin
            if (clr) begin
                Q <= {DATA_WIDTH_IN{1'b0}};
            end
            else if (enable) begin
            Q <= BusMuxOut;
            end
        end
    assign BusMuxIn = Q [DATA_WIDTH_OUT-1:0];
endmodule