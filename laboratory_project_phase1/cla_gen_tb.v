module cla_gen_tb ();
 
parameter WIDTH = 32;
 
reg [WIDTH-1:0] reg_ADD_1 = 0;
reg [WIDTH-1:0] reg_ADD_2 = 0;
wire [WIDTH:0]  w_Result;
   
cla_gen #(.WIDTH(WIDTH)) cla_gen_i (
        .in_add1(reg_ADD_1),
        .in_add2(reg_ADD_2),
        .out_Sum(w_Result)
);
 
initial
    begin
        #10;
        reg_ADD_1 = 32'h0;
        reg_ADD_2 = 32'h1;
        #10;
        reg_ADD_1 = 32'h2;
        reg_ADD_2 = 32'h2;
        #10;
        reg_ADD_1 = 32'h5;
        reg_ADD_2 = 32'h6;
        #10;
        reg_ADD_1 = 32'h7;
        reg_ADD_2 = 32'h7;
        #10;
    end
 
endmodule