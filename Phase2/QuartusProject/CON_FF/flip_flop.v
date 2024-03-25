module flip_flop(
    output reg Q, 
    // output reg Q_not,
    input wire D, 
    input wire clk 
);	
	initial begin
		Q <= 0;
		// Q_not <= 1;
	end
	always@(clk, D) 
	begin
		Q <= D;
		// Q_not <= !D;
	end
endmodule