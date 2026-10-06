`timescale 1ns / 1ps

module tb_dff_SR();
     wire tb_q;
     reg tb_clk;
     reg tb_d;
     reg tb_set;
     reg tb_reset;

//Port Mapping
dff_SR dff_SR_instant
(
    .clk(tb_clk),
    .d(tb_d),
    .set(tb_set),
    .reset(tb_reset),

    .q(tb_q)
);

// Clock 10 ns period
initial tb_clk = 0;
always #5 tb_clk = ~tb_clk;

//Test Samples
initial
    begin
    tb_d = 0; tb_set = 0; tb_reset = 0;
    #12;

    // Normal D operation
    tb_d = 1; #10;
    tb_d = 0; #10;
    tb_d = 1; #10;

    // Synchronous set q only changes at the next rising clk edge
    tb_d = 0; tb_set = 1; #10;
    tb_set = 0; #10;

    // Synchronous reset q only changes at the next rising clk edge
    tb_d = 1; tb_reset = 1; #10;
    tb_reset = 0; #10;

    // Back to normal
    tb_d = 1; #10;
    tb_d = 0; #10;

    #20 $finish;
    
    end 
    
endmodule