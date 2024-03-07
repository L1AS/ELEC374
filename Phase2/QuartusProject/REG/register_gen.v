module register_gen #(parameter WIDTH = 32)(
    output wire [WIDTH-1:0]BusMuxIn,
    input clear, clock, enable, 
    input [WIDTH-1:0]BusMuxOut
); 
reg [WIDTH-1:0]q; 
initial q = {WIDTH{1'b0}};
always @ (posedge clock)
        begin
            if (clear) begin
                q<= {WIDTH{1'b0}};
            end
            else if (enable) begin
            q <= BusMuxOut;
            end
        end
    assign BusMuxIn = q[WIDTH-1:0];
endmodule
