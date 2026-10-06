module ctr8 (
    output reg [7:0] counter,
    output reg carryout,
    input [7:0] data, input load, clk, reset );

    always @(posedge clk or negedge reset)
    begin
        if (!reset) {carryout, counter} <= 9'b0;
        else if (load) {carryout, counter} <= data;
        else {carryout, counter} <= counter + 1'b1;
    end
endmodule


