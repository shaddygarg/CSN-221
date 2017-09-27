`timescale 1ns / 1ps
//This module is the control unit of the RISC processor
module ControlUnit(
    input[3:0] opcode,
    output reg[1:0] alu_op,
    output reg reg_dst,alu_src,mem_read,mem_write,mem_to_reg,reg_write,jump,bne,beq
    );
    
always @(*)
begin
    case(opcode)
        4'b0000: //Load Word
            begin
                reg_dst = 1'b0;
                alu_src = 1'b1;
                mem_to_reg = 1'b1;
                reg_write = 1'b1;
                mem_read = 1'b1;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b10;
                jump = 1'b0;
            end
        4'b0001: //Store Word
            begin
                reg_dst = 1'b0;
                alu_src = 1'b1;
                mem_to_reg = 1'b0;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b1;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b10;
                jump = 1'b0;
            end
        4'b0010://Adding(D-Type Instruction)
            begin 
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;                
            end
       4'b0011://Subtracting(D-Type Instruction)
            begin 
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;                
            end
        4'b0100://Multiply(D-Type Instruction)
            begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;
            end
        4'b0101://Shift Left Logical(D-Type Instruction)
            begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;
            end
        4'b0110://Shift Right Logical(D-Type Instruction)
            begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;
            end
        4'b0111://BitwiseAND(D-Type Instruction)
            begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;
            end
        4'b1000://BitwiseOR(D-TypeInstruction)
            begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;
            end
        4'b1001://SetIfLessThan(D-Type Instruction)
            begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;
            end
        4'b1010://BitwiseXOR(D-Type Instruction)
            begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;
            end
        4'b1011://Invert(D-Type Instruction)
            begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;                
            end
        4'b1100://BranchIfEqualTo
            begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b1;
                bne = 1'b0;
                alu_op = 2'b01;
                jump = 1'b0;
            end
        4'b1101://BranchIfNotEqualTo
            begin
                reg_dst = 1'b0;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b1;
                alu_op = 2'b01;
                jump = 1'b0;
            end
        4'b1110://Jump
            begin
                reg_dst = 1'b0;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b0;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b11;
                jump = 1'b1;
            end
        default:
            begin
                reg_dst = 1'b1;
                alu_src = 1'b0;
                mem_to_reg = 1'b0;
                reg_write = 1'b1;
                mem_read = 1'b0;
                mem_write = 1'b0;
                beq = 1'b0;
                bne = 1'b0;
                alu_op = 2'b00;
                jump = 1'b0;
            end
        endcase
    end      
endmodule
