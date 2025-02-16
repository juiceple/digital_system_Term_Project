// 3-to-8 Decoder using Gates
module decoder_3to8_gatelevel (
    input [2:0] in,
    output [7:0] out
);
    wire in0_not, in1_not, in2_not;

    // NOT Gates
    not_gate n0 (.a(in[0]), .out(in0_not));
    not_gate n1 (.a(in[1]), .out(in1_not));
    not_gate n2 (.a(in[2]), .out(in2_not));

    // AND Gates for Decoder Logic
    and_gate a0 (.a(in0_not), .b(in1_not), .out(out[0]));
    and_gate a1 (.a(in[0]), .b(in1_not), .out(out[1]));
    and_gate a2 (.a(in0_not), .b(in[1]), .out(out[2]));
    and_gate a3 (.a(in[0]), .b(in[1]), .out(out[3]));
    and_gate a4 (.a(in0_not), .b(in1_not), .c(in[2]), .out(out[4]));
    and_gate a5 (.a(in[0]), .b(in1_not), .c(in[2]), .out(out[5]));
    and_gate a6 (.a(in0_not), .b(in[1]), .c(in[2]), .out(out[6]));
    and_gate a7 (.a(in[0]), .b(in[1]), .c(in[2]), .out(out[7]));
endmodule