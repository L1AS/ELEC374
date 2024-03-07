module DataPath (
  input wire clock, clear,
  input wire [31:0] A,
  input wire [31:0] RegisterAimmediate,
  input wire RAout, RBout, RZout,
  input wire RAin, RBin, RZin
);

wire [31:0] BusMuxout, BusMuxInRZ, BusMuxInRA, BusMuxInRB;

wire [31:0] ZRegin;

// Devices
register RA(clear, clock, RAin, RegisterAimmediate, BusMuxInRA);
register RB(clear, clock, RBin, BusMuxout, BusMuxInRB);

// adder
adder add(A, BusMuxout, ZRegin);
register RZ(clear, clock, RZin, ZRegin, BusMuxInRZ);

// Bus
Bus bus(BusMuxInRZ, BusMuxInRA, BusMuxInRB, RZout, RAout, RBout, BusMuxout);

endmodule