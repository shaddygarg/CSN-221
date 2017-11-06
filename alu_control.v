`timescale 1ns / 1ps

module alu_control(ALU_Cnt,ALU_OP,ALU_OP_CODE);
	output reg[3:0] ALU_Cnt;
	input [1:0] ALU_OP;
	input [3:0] ALU_OP_CODE;

	wire [5:0] ALU_CONTROL_INPUT;

	assign ALU_CONTROL_INPUT = {ALU_OP,ALU_OP_CODE};

	always @(ALU_CONTROL_INPUT)
	casex(ALU_CONTROL_INPUT)
		6'b10xxxx : ALU_Cnt = 4'b0000;	//lw,store
		6'b01xxxx : ALU_Cnt = 4'b0001;	//bne.beq
		6'b000000 : ALU_Cnt = 4'b0000;	//add
		6'b000001 : ALU_Cnt = 4'b0001;	//sub
		6'b000010 : ALU_Cnt = 4'b0010;	//mult
		6'b000011 : ALU_Cnt = 4'b0011;	//sll
		6'b000100 : ALU_Cnt = 4'b0100;	//srl
		6'b000101 : ALU_Cnt = 4'b0101;	//and
		6'b000110 : ALU_Cnt = 4'b0110;	//or
		6'b000111 : ALU_Cnt = 4'b0111;	//slt
		6'b001000 : ALU_Cnt = 4'b1000;	//xor
		6'b001001 : ALU_Cnt = 4'b1001;	//invert

	default   : ALU_Cnt = 4'b0000;
	endcase

endmodule
