module register_gen #(parameter WIDTH = 32)(
    input clear, clock, enable,
    input [WIDTH-1:0] BusMuxOut,  
    output [WIDTH-1:0] BusMuxIn    
); 
reg [WIDTH-1:0]q; 
initial q = {WIDTH{1'h0}};
always @ (posedge clock)
        begin
            if (clear) begin
                q <= {WIDTH{1'b0}};
            end
            else if (enable) begin
                q <= BusMuxOut;
            end
        end
    assign BusMuxIn = q[WIDTH-1:0];
endmodule
