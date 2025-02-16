// 3-bit Counter using D Flip-Flops and Gates
module counter_3bit_gatelevel (
    input clk, rst,
    output [2:0] q
);
    wire d0, d1, d2;
    wire q0_not, q1_not, q2_not;

    // NOT Gates
    not_gate n0 (.a(q[0]), .out(q0_not));
    not_gate n1 (.a(q[1]), .out(q1_not));
    not_gate n2 (.a(q[2]), .out(q2_not));

    // D Flip-Flop Input Logic
    and_gate a0 (.a(q[0]), .b(q[1]), .out(d2)); // d2 = q[0] AND q[1]
    or_gate  o0 (.a(q[0]), .b(q[1]), .out(d1)); // d1 = q[0] OR q[1]
    not_gate n3 (.a(q[0]), .out(d0));           // d0 = NOT q[0]

    // D Flip-Flops
    d_flip_flop_asyncRst dff0 (.clk(clk), .rst(rst), .d(d0), .q(q[0]));
    d_flip_flop_asyncRst dff1 (.clk(clk), .rst(rst), .d(d1), .q(q[1]));
    d_flip_flop_asyncRst dff2 (.clk(clk), .rst(rst), .d(d2), .q(q[2]));
endmodule