`timescale 1ns / 1ps

module tb_alu();
//Define I/O Ports
     wire [3:0] ALU_Out ; 
     wire CarryOut; 
    //NO OVERFLOW CHECK? 
    //No ZERO wire?     
     reg [3:0] tb_din_A;
     reg [3:0] tb_din_B;
     reg [3:0] tb_alu_Sel;
    
//Port Mapping
alu alu_instant
(
    .A(tb_din_A), 
    .B(tb_din_B), 
    .ALU_Sel(tb_alu_Sel), 
    
    .ALU_Out(ALU_Out),
    .CarryOut(CarryOut)
 );   
 
integer i, j;

 initial
    begin 
    
    //Test samples for Addition
    // Nested loops for A and B
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            tb_din_A = i;
            tb_din_B = j;
            tb_alu_Sel = 4'b0000; // Addition
            #10; // Wait 10 ns for each operation 
            $display("ADD time=%0t", $time); 
            $display("Input A: " , tb_din_A); 
            $display("Input B: " , tb_din_B); 
            $display("Result ALU: " , ALU_Out);
            $display("Result CarryOut: " , CarryOut); 
        end 
    end
    #20; 
    
  
    //Test samples for Subtraction
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            tb_din_A = i;
            tb_din_B = j;
            tb_alu_Sel = 4'b0001; // Subtraction
            #10;
            $display("SUB time=%0t", $time); 
            $display("Input A: " , tb_din_A); 
            $display("Input B: " , tb_din_B); 
            $display("Result ALU: " , ALU_Out);
            $display("Result CarryOut: " , CarryOut); 
        end 
    end
    #20; 
     
    
    
    //Test samples for Multiplication
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            tb_din_A = i;
            tb_din_B = j;
            tb_alu_Sel = 4'b0010; // Multiplication
            #10;
            $display("MULT time=%0t", $time); 
            $display("Input A: " , tb_din_A); 
            $display("Input B: " , tb_din_B); 
            $display("Result ALU: " , ALU_Out);
            $display("Result CarryOut: " , CarryOut); 
        end 
    end
    #20; 
    
    //Test samples for Division
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            tb_din_A = i;
            tb_din_B = j;
            tb_alu_Sel = 4'b0011; // Division
            #10;
            $display("DIV time=%0t", $time); 
            $display("Input A: " , tb_din_A); 
            $display("Input B: " , tb_din_B); 
            $display("Result ALU: " , ALU_Out);
            $display("Result CarryOut: " , CarryOut); 
        end 
    end
    #20; 
     
    
    
  //Test samples for Logical shift left 
    // Single loop for A (B is unused)
    tb_din_B = 0;
    for (i = 0; i < 16; i = i + 1) begin
        tb_din_A = i;
        tb_alu_Sel = 4'b0100; // Logical shift left
        #10;
        $display("SHL time=%0t", $time); 
        $display("Input A: " , tb_din_A); 
        $display("Result ALU: " , ALU_Out);
        $display("Result CarryOut: " , CarryOut); 
    end
    #20; 

    //Test samples for Logical shift right 
    tb_din_B = 0;
    for (i = 0; i < 16; i = i + 1) begin
        tb_din_A = i;
        tb_alu_Sel = 4'b0101; // Logical shift right
        #10;
        $display("SHR time=%0t", $time); 
        $display("Input A: " , tb_din_A); 
        $display("Result ALU: " , ALU_Out);
        $display("Result CarryOut: " , CarryOut); 
    end
    #20;
 

   //Test samples for Rotate left 
    tb_din_B = 0;
    for (i = 0; i < 16; i = i + 1) begin
        tb_din_A = i;
        tb_alu_Sel = 4'b0110; // Rotate left
        #10;
        $display("ROTL time=%0t", $time); 
        $display("Input A: " , tb_din_A); 
        $display("Result ALU: " , ALU_Out);
        $display("Result CarryOut: " , CarryOut); 
    end
    #20; 

    //Test samples for Rotate right 
    tb_din_B = 0;
    for (i = 0; i < 16; i = i + 1) begin
        tb_din_A = i;
        tb_alu_Sel = 4'b0111; // Rotate right
        #10;
        $display("ROTR time=%0t", $time); 
        $display("Input A: " , tb_din_A); 
        $display("Result ALU: " , ALU_Out);
        $display("Result CarryOut: " , CarryOut); 
    end
    #20;

    //Test samples for Bitwise AND 
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            tb_din_A = i;
            tb_din_B = j;
            tb_alu_Sel = 4'b1000; // Bitwise AND
            #10;
            $display("AND time=%0t", $time); 
            $display("Input A: " , tb_din_A); 
            $display("Input B: " , tb_din_B); 
            $display("Result ALU: " , ALU_Out);
            $display("Result CarryOut: " , CarryOut); 
        end 
    end
    #20; 

    //Test samples for Bitwise OR 
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            tb_din_A = i;
            tb_din_B = j;
            tb_alu_Sel = 4'b1001; // Bitwise OR
            #10;
            $display("OR time=%0t", $time); 
            $display("Input A: " , tb_din_A); 
            $display("Input B: " , tb_din_B); 
            $display("Result ALU: " , ALU_Out);
            $display("Result CarryOut: " , CarryOut); 
        end 
    end
    #20; 
 

    //Test samples for Bitwise XOR 
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            tb_din_A = i;
            tb_din_B = j;
            tb_alu_Sel = 4'b1010; // Bitwise XOR
            #10;
            $display("XOR time=%0t", $time); 
            $display("Input A: " , tb_din_A); 
            $display("Input B: " , tb_din_B); 
            $display("Result ALU: " , ALU_Out);
            $display("Result CarryOut: " , CarryOut); 
        end 
    end
    #20; 

    //Test samples for Bitwise NOR 
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            tb_din_A = i;
            tb_din_B = j;
            tb_alu_Sel = 4'b1011; // Bitwise NOR
            #10;
            $display("NOR time=%0t", $time); 
            $display("Input A: " , tb_din_A); 
            $display("Input B: " , tb_din_B); 
            $display("Result ALU: " , ALU_Out);
            $display("Result CarryOut: " , CarryOut); 
        end 
    end
    #20; 

    //Test samples for Bitwise NAND 
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            tb_din_A = i;
            tb_din_B = j;
            tb_alu_Sel = 4'b1100; // Bitwise NAND
            #10;
            $display("NAND time=%0t", $time); 
            $display("Input A: " , tb_din_A); 
            $display("Input B: " , tb_din_B); 
            $display("Result ALU: " , ALU_Out);
            $display("Result CarryOut: " , CarryOut); 
        end 
    end
    #20; 

    //Test samples for Bitwise XNOR 
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            tb_din_A = i;
            tb_din_B = j;
            tb_alu_Sel = 4'b1101; // Bitwise XNOR
            #10;
            $display("XNOR time=%0t", $time); 
            $display("Input A: " , tb_din_A); 
            $display("Input B: " , tb_din_B); 
            $display("Result ALU: " , ALU_Out);
            $display("Result CarryOut: " , CarryOut); 
        end 
    end
    #20; 


    //Test samples for Greater comparison 
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            tb_din_A = i;
            tb_din_B = j;
            tb_alu_Sel = 4'b1110; // Greater comparison
            #10;
            $display("GREATER time=%0t", $time); 
            $display("Input A: " , tb_din_A); 
            $display("Input B: " , tb_din_B); 
            $display("Result ALU: " , ALU_Out);
            $display("Result CarryOut: " , CarryOut); 
        end 
    end
    #20; 


    //Test samples for Equal comparison 
    for (i = 0; i < 16; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            tb_din_A = i;
            tb_din_B = j;
            tb_alu_Sel = 4'b1111; // Equal comparison
            #10;
            $display("EQUAL time=%0t", $time); 
            $display("Input A: " , tb_din_A); 
            $display("Input B: " , tb_din_B); 
            $display("Result ALU: " , ALU_Out);
            $display("Result CarryOut: " , CarryOut); 
        end 
    end
    #20;
     
     
end
endmodule

