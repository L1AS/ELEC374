module memory_custom #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 9,
    parameter MEM_DEPTH = 512  // 2**9
)(
//    output reg [DATA_WIDTH-1:0] data_out,
	output [(DATA_WIDTH-1):0] data_out,
//    output reg done,                            // Signal to indicate operation completion
//    input wire clk,                             // Still need a clock for the 'done' signaling
    input [(ADDR_WIDTH-1):0] addr,
    input [(DATA_WIDTH-1):0] data_in,
    input write_enable,
    input read_enable
);
	
	// Declare the RAM variable
//    reg [DATA_WIDTH-1:0] memory [0:MEM_DEPTH-1];
	reg [DATA_WIDTH-1:0] memory [MEM_DEPTH-1:0];
	
	// Variable to hold the registered read address
	reg [ADDR_WIDTH-1:0] addr_reg;

    initial begin
        $readmemh("asm_HEX_Phase3", memory);
    end
    // Asynchronous Write Operation
    always @(write_enable, addr, data_in) begin
        if (write_enable) begin
            memory[addr] <= data_in;
            // Indicate that write operation is done in the next clock cycle
            // This is a compromise for synthesisable code
//            done <= 1'b0; // Ensure done is initially low
//            #1; // Small delay to simulate asynchrony - not synthesizable, used for illustration
//            done <= 1'b1; // Set done high briefly
        end
    end

    // Asynchronous Read Operation
    always @(read_enable, addr) begin
        if (read_enable) begin
			addr_reg <= addr;
//            data_out <= memory[addr];
            // Indicate that read operation is done in the next clock cycle
            // This is a compromise for synthesisable code
//            done <= 1'b0; // Ensure done is initially low
//            #1; // Small delay to simulate asynchrony - not synthesizable, used for illustration
//            done <= 1'b1; // Set done high briefly
        end
    end
	assign data_out = memory[addr_reg];
//    // Reset 'done' signal on clock edge
//    always @(posedge clk) begin
//        done <= 1'b0;
//    end

endmodule


`timescale 1ns/100ps
module memory_test;
    wire [31:0]data_out;
    reg [8:0] addr;
    reg [511:0] data_in;
    reg write_enable, read_enable;
    memory_custom mem(
        data_out, addr, data_in, 
        write_enable, read_enable
     );
	initial begin
		
	end
endmodule

