module memory_custom #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 9,
    parameter MEM_DEPTH = 512
)(
    output reg [DATA_WIDTH-1:0] data_out,
    input wire [ADDR_WIDTH-1:0] addr,
    input wire [DATA_WIDTH-1:0] data_in,
    input wire write_enable,
    input wire read_enable
);

    reg [DATA_WIDTH-1:0] memory [0:MEM_DEPTH-1];

    initial begin
        $readmemh("C:/Users/19tja3/Documents/ELEC374/Phase3/QuartusProject/asm_HEX_Phase3.txt", memory);
    end
    // Asynchronous Write Operation
    always @(write_enable, addr, data_in) begin
        if (write_enable) begin
            memory[addr] <= data_in;

        end
    end

    // Asynchronous Read Operation
    always @(read_enable, addr) begin
        if (read_enable) begin
            data_out <= memory[addr];

        end
    end


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
