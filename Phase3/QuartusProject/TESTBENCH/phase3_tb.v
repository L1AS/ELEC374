`timescale 1ns/10ps

module phase3_tb;
	reg clock, reset, stop;
	wire[31:0] inPortDataIn, outPortData;

miniSRC DUT(
	.clock(clock),
	.reset(reset),
	.stop(stop),
	.outPortData(outPortData), 
	.inPortDataIn(inPortDataIn)
);

	initial begin
		clock = 0;
		reset = 0;
	end

	always #10 clock <= ~clock;

endmodule