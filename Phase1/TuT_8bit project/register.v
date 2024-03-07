module register #(parameter DATA_WIDTH_IN = 32, DATA_WIDTH_OUT = 32, INIT = 32'h0)(
    input clear, clock, enable, 
    input [DATA_WIDTH_IN-1:0]BusMuxOut, 
    output wire [DATA_WIDTH_OUT-1:0]BusMuxIn
); 
reg [DATA_WIDTH_IN-1:0]data; 
initial data = INIT;
always @ (posedge clock)
        begin
            if (clear) begin
                data<= {DATA_WIDTH_IN{1'b0}};
            end
            else if (enable) begin
            data <= BusMuxOut;
            end
        end
    assign BusMuxIn = data[DATA_WIDTH_OUT-1:0];
endmodule
