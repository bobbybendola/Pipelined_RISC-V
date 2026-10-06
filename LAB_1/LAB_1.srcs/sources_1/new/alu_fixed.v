module alu_fixed(
    input [3:0] A,B, 
    input [3:0] ALU_Sel,
    output [3:0] ALU_Out, 
    output CarryOut 
);

reg [7:0] ALU_Result;
wire [4:0] tmp;
assign ALU_Out = ALU_Result; // ALU out
assign tmp = {1'b0,A} + {1'b0,B};

assign CarryOut = (ALU_Sel == 4'b0000) ? tmp[4] :          // Addition
                  (ALU_Sel == 4'b0001) ? (A < B) :         // Subtraction 
                  (ALU_Sel == 4'b0010) ? ALU_Result[4] :   // Multiplication
                  (ALU_Sel == 4'b0011) ? ALU_Result[4] :   // Division
                  (ALU_Sel == 4'b0100) ? A[3] :            // Logical shift left
                  (ALU_Sel == 4'b0101) ? A[0] :            // Logical shift right
                  (ALU_Sel == 4'b0110) ? A[3] :            // Rotate left
                  (ALU_Sel == 4'b0111) ? A[0] :            // Rotate right
                  1'b0;                                    // everything else is 0

always @(*)
begin
    case(ALU_Sel)
    4'b0000: // Addition
        ALU_Result = A + B;
    4'b0001: // Subtraction
        ALU_Result = A - B;
    4'b0010: // Multiplication
        ALU_Result = A * B;
    4'b0011: // Division
        ALU_Result = A/B;
    4'b0100: // Logical shift left
        ALU_Result = A<<1;
    4'b0101: // Logical shift right
        ALU_Result = A>>1;
    4'b0110: // Rotate left
        ALU_Result = {A[2:0],A[3]};
    4'b0111: // Rotate right
        ALU_Result = {A[0], A[3:1]};
    4'b1000: // Bitwise and
        ALU_Result = A & B;
    4'b1001: // Bitwise or
        ALU_Result = A | B;
    4'b1010: // Bitwise xor
        ALU_Result = A ^ B;
    4'b1011: // Bitwise nor
        ALU_Result = ~(A | B);
    4'b1100: // Bitwise nand
        ALU_Result = ~(A & B);
    4'b1101: // Bitwise xnor
        ALU_Result = ~(A ^ B);
    4'b1110: // Greater comparison
        ALU_Result = (A>B) ? 4'b1 : 4'b0;
    4'b1111: // Equal comparison
        ALU_Result = (A==B) ? 4'b1 : 4'b0;
    default: ALU_Result = A + B;
    endcase
end

endmodule