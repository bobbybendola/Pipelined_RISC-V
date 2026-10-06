`timescale 1ns / 1ps

module dff_PC (clk, d, preset, clear, q);
    input clk, d, preset, clear;
    output reg q;

    always @(posedge clk or posedge preset or posedge clear) begin
        if (clear)
            q <= 1'b0;
        else if (preset)
            q <= 1'b1;
        else
            q <= d;
    end
endmodule