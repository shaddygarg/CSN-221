`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2017 12:02:22 PM
// Design Name: 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module reg_file(
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
reg_number[0] <= 15'b0;
reg_number[1] <= 15'b0;
reg_number[2] <= 15'b0;
reg_number[3] <= 15'b0;
reg_number[4] <= 15'b0;
reg_number[5] <= 15'b0;
reg_number[6] <= 15'b0;
reg_number[7] <= 15'b0;
end
always @(*) begin
if(enable) begin
reg_number[wr_reg] <= wr_data;
end
end
assign read_data1 = (read_addr1 == 0) ? 15'b0 : reg_number[read_addr1];
assign read_data2 = (read_addr2 == 0) ? 15'b0 : reg_number[read_addr2];  
endmodule
