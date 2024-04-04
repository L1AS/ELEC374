`timescale 1ns/10ps

module phase3_tb;
	reg clock, reset, stop, inPort_en;
	wire run;
	wire[31:0] outPortData;
	reg[31:0] inPortDataIn;

miniSRC DUT(
	.clock(clock),
	.reset(reset),
	.run(run),
	.stop(stop),
	.outPortData(outPortData),
	.inPort_en(inPort_en), 
	.inPortDataIn(inPortDataIn)
);

	initial begin
		clock = 0;
		reset = 0;
		inPort_en <= 1;
		inPortDataIn <= 32'h00000080;
	end
	always@(*) begin
		if(run) stop <= 0;
		else stop <= 1;
	end
	always #10 clock <= ~clock;

endmodule