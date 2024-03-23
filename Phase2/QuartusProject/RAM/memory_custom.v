module memory_custom #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 9,
    parameter MEM_DEPT = 512,
    string parameter FILE_NAME = "initial_data.hex"
)(
    output reg [DATA_WIDTH-1:0] data_out,
    output reg done                            // Signal to indicate operation completion
    input wire clk,                             // Still need a clock for the 'done' signaling
    input wire [ADDR_WIDTH-1:0] addr,
    input wire [DATA_WIDTH-1:0] data_in,
    input wire write_enable,
    input wire read_enable,
);

    reg [DATA_WIDTH-1:0] memory [0:MEM_DEPTH-1];

    initial begin
        $readmemh(FILE_NAME, memory)
    end
    // Asynchronous Write Operation
    always @(write_enable, addr, data_in) begin
        if (write_enable) begin
            memory[addr] <= data_in;
            // Indicate that write operation is done in the next clock cycle
            // This is a compromise for synthesisable code
            done <= 1'b0; // Ensure done is initially low
            #1; // Small delay to simulate asynchrony - not synthesizable, used for illustration
            done <= 1'b1; // Set done high briefly
        end
    end

    // Asynchronous Read Operation
    always @(read_enable, addr) begin
        if (read_enable) begin
            data_out <= memory[addr];
            // Indicate that read operation is done in the next clock cycle
            // This is a compromise for synthesisable code
            done <= 1'b0; // Ensure done is initially low
            #1; // Small delay to simulate asynchrony - not synthesizable, used for illustration
            done <= 1'b1; // Set done high briefly
        end
    end

    // Reset 'done' signal on clock edge
    always @(posedge clk) begin
        done <= 1'b0;
    end

endmodule
