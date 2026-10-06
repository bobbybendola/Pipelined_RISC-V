`timescale 1ns / 1ps

module tb_dff_PC();
//Define I/O Ports
     wire tb_q;
     reg tb_clk;
     reg tb_d;
     reg tb_preset;
     reg tb_clear;

//Port Mapping
dff_PC dff_PC_instant
(
    .clk(tb_clk),
    .d(tb_d),
    .preset(tb_preset),
    .clear(tb_clear),

    .q(tb_q)
);

// Clock generation, 10 ns period
initial tb_clk = 0;
always #5 tb_clk = ~tb_clk;

//Test Samples
initial
    begin
    tb_d = 0; tb_preset = 0; tb_clear = 0;
    #12;

    // Normal D operation
    tb_d = 1; #10;
    tb_d = 0; #10;
    tb_d = 1; #10;

    // Asynchronous preset q goes to 1 immediately, between clock edges
    tb_d = 0;
    #2 tb_preset = 1;
    #3 tb_preset = 0;
    #10;

    // Asynchronous clear q goes to 0 immediately, between clock edges
    tb_d = 1; #3;
    tb_clear = 1;
    #3 tb_clear = 0;
    #10;

    // Back to normal
    tb_d = 1; #10;
    tb_d = 0; #10;

    #20 $finish;
end //end of test samples

endmodule