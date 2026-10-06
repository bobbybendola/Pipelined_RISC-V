`timescale 1ns / 1ps

module dff_SR (clk, d, set, reset, q);
    input clk, d, set, reset;
    output reg q;

    always @(posedge clk) begin
        if (reset)
            q <= 1'b0;
        else if (set)
            q <= 1'b1;
        else
            q <= d;
    end
endmodule