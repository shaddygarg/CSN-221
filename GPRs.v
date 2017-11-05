`timescale 1ns / 1ps

module GPRs(
    input clk,
    input enable,
    input [2:0] read_addr1,
    output [15:0] read_data1,
    input [2:0] read_addr2,
    output [15:0] read_data2,
    input [2:0] wr_reg,
    input [15:0] wr_data   
);
reg [15:0] reg_number [7:0];
initial begin
    reg_number[0] <= 16'b0;
    reg_number[1] <= 16'b0;
    reg_number[2] <= 16'b0;
    reg_number[3] <= 16'b0;
    reg_number[4] <= 16'b0;
    reg_number[5] <= 16'b0;
    reg_number[6] <= 16'b0;
    reg_number[7] <= 16'b0;
end
always @(*) begin
if(enable) begin
reg_number[wr_reg] <= wr_data;
end
end
assign read_data1 = (read_addr1 == 0) ? 16'b0 : reg_number[read_addr1];
assign read_data2 = (read_addr2 == 0) ? 16'b0 : reg_number[read_addr2];  
endmodule
