`timescale 1ns / 1ps

module control(
    input reset,
    input[5:0] opcode,
    output reg reg_dst, mem_to_reg,
    output reg [1:0] alu_op,
    output reg mem_read, mem_write, alu_src, reg_write, branch, jump
    );

always @(*)
begin
   // defaults: every signal gets a value on every path (no latches, no X)
   reg_dst    = 1'b0;
   mem_to_reg = 1'b0;
   alu_op     = 2'b00;
   mem_read   = 1'b0;
   mem_write  = 1'b0;
   alu_src    = 1'b0;
   reg_write  = 1'b0;
   branch     = 1'b0;
   jump       = 1'b0;

   if(reset == 1'b1)
   begin
      alu_op = 2'b10;
   end
   else
   begin
      case(opcode)
      6'b000000:
      begin // R-type: add, sub, and, or, nor, slt, xor, mult, div
            reg_dst   = 1'b1;
            alu_op    = 2'b10;
            reg_write = 1'b1;
      end
      6'b110000:
      begin // shifts: sll, srl, sra (shamt comes through imm_value[10:6])
            reg_dst   = 1'b1;
            alu_op    = 2'b10;
            alu_src   = 1'b1;
            reg_write = 1'b1;
      end
      6'b001000:
      begin // addi
            alu_op    = 2'b00;
            alu_src   = 1'b1;
            reg_write = 1'b1;
      end
      6'b001100:
      begin // andi
            alu_op    = 2'b11;
            alu_src   = 1'b1;
            reg_write = 1'b1;
      end
      6'b100011:
      begin // lw
            mem_to_reg = 1'b1;
            alu_op     = 2'b00;
            mem_read   = 1'b1;
            alu_src    = 1'b1;
            reg_write  = 1'b1;
      end
      6'b101011:
      begin // sw
            alu_op    = 2'b00;
            mem_write = 1'b1;
            alu_src   = 1'b1;
      end
      6'b000100:
      begin // beq
            alu_op = 2'b01;
            branch = 1'b1;
      end
      6'b000010:
      begin // j
            jump = 1'b1;
      end
      default: ; // unknown opcode: all signals stay 0 (acts as a nop)
      endcase
   end
end
endmodule