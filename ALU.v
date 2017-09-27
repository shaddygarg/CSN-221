`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2017 02:28:07 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
input [15:0] A,
input [15:0] B,
input [3:0] alu_control,
output reg[15:0] result,
output zero
    );
always @(*) begin
case(alu_control)
		4'b0000:result =A+B;	//add
		4'b0001:result =A-B;	//sub
		4'b0010:result =A*B;	//mult
		4'b0011:result =A<<B;	//sll
		4'b0100:result =A>>B;	//srl
		4'b0101:result =A&B;	//and
		4'b0110:result =A | B;	//or
		4'b0111:                //slt
		begin if (A<B)
			result = 15'b1;
			else result =15'b0;
		end
		4'b1000:result =A ^ B;	//xor
		4'b1001:result =~A;     //invert
        default : result =A+B;//add is default 
endcase
end
assign zero =(result==15'b0)? 1'b1:1'b0;     
endmodule
