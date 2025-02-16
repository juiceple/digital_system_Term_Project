module d_flip_flop_8bit (
    input [7:0] d,
    input clk, rst, en,
    output [7:0] q
);

    d_flip_flop_en_asyncRst dff0 (.d(d[0]), .clk(clk), .rst(rst), .en(en), .q(q[0]));
    d_flip_flop_en_asyncRst dff1 (.d(d[1]), .clk(clk), .rst(rst), .en(en), .q(q[1]));
    d_flip_flop_en_asyncRst dff2 (.d(d[2]), .clk(clk), .rst(rst), .en(en), .q(q[2]));
    d_flip_flop_en_asyncRst dff3 (.d(d[3]), .clk(clk), .rst(rst), .en(en), .q(q[3]));
    d_flip_flop_en_asyncRst dff4 (.d(d[4]), .clk(clk), .rst(rst), .en(en), .q(q[4]));
    d_flip_flop_en_asyncRst dff5 (.d(d[5]), .clk(clk), .rst(rst), .en(en), .q(q[5]));
    d_flip_flop_en_asyncRst dff6 (.d(d[6]), .clk(clk), .rst(rst), .en(en), .q(q[6]));
    d_flip_flop_en_asyncRst dff7 (.d(d[7]), .clk(clk), .rst(rst), .en(en), .q(q[7]));

endmodule
