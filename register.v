module register #(parameter DATA_WIDTH_IN = 8, DATA_WIDTH_OUT = 8, INIT - 8'ho)(
    input clear, clock, enable
    input [DATA_WIDTH_IN-1:0]BusMuxOut,
    output wire [DATA_WIDTH_OUT-1:0]BusMuxInRA
);
reg [DATA_WIDTH_IN-1:0]q;
initial q = INIT;
always @ (posedge clock)
    begin
        if (clear) begin    
            q <= {DATA_WIDTH_IN{1'b0}};
        end
        else if (enable) begin
            q <= BusMuxOut;
        end
    end
    
endmodule