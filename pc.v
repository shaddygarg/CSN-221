`timescale 1ns/1ps

module PC
  (
   input 	 clk,
   assign 	 PCinput = {jump, br},
  
   input [15:0]  br_add,
   input [15:0]  jump_add,
   output [15:0] pc
   );


   reg [15:0] pc;
   initial begin
       pc = {16{1'b0}};
   end

   always @(posedge clk) begin
       case (PCinput)
	 2'b00: begin
	     pc = pc + 4;
	 end
	 2'b01: begin
	     pc = br_add;
	 end
	 2'b10: begin
	     pc = jump_add;
	 end
	 default: begin
	     pc = {16{1'b0}};
	 end
       endcase // case (PCinput)
   end // always @ (posedge clk)
endmodule // PC
