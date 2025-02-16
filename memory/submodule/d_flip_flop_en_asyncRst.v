//This is for the D flip flop module.

module d_flip_flop_en_asyncRst (
    input d,
    input clk, rst, en,
    output reg q
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q <= 1'b0;
        end
        else if (en) begin
            q <= d;
        end
    end
endmodule