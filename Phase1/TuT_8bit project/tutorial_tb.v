`timescale 1ns/10ps
module tutorial_tb();
  reg clock, clear, RZout, RAout, RBout, RAin, RBin, RZin;
  reg [31:0] AddImmediate;
  reg [31:0] RegisterAimmediate;

  reg [31:0] present_state;

DataPath DP(
  clock, clear,
  AddImmediate,
  RegisterAimmediate,
  RZout, RAout, RBout,
  RAin, RBin, RZin
);

parameter init = 4'd1, T0 = 4'd2, T1 = 4'd3, T2 = 4'd4;

initial begin clock = 0; present_state = 4'd0; end
always #10 clock = ~clock;
always @ (negedge clock) present_state = present_state + 1;

always @(present_state) begin
  case (present_state)
    init: begin
      clear <= 1;
      AddImmediate <= 32'h00; RegisterAimmediate <= 32'h00;
      RZout <= 0; RAout <= 0; RBout <= 0; RAin <= 0; RBin <= 0; RZin <= 0;
      #15 clear <= 0;
    end 
    // ldi A, 5
    T0: begin
      RegisterAimmediate <= 32'h5; RAin <= 1;
      #15 RegisterAimmediate <= 32'h00; RAin <= 0;
    end
    // addi B, A, 5 - 2 steps
    // add value in register A and immediate 5 and then save in Z
    T1: begin
      RAout <= 1; AddImmediate <= 32'h5; RZin <= 1;
      #15 RAout <= 0; RZin <= 0;
    end
    // mv B, Z - move value in Z to B
    T2: begin
      RZout <= 1; RBout <= 1;
      #15 RZout <= 0; RBout <= 0;
    end
  endcase
end
endmodule
