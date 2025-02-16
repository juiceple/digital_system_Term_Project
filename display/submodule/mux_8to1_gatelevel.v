// 8:1 MUX using Gates
module mux_8to1_gatelevel (
    input [2:0] sel,
    input [6:0] d0, d1, d2, d3, d4, d5, d6, d7,
    output [6:0] y
);
    wire [7:0] sel_lines;
    wire [6:0] and_outputs[7:0];

    // Decoder for Select Lines
    decoder_3to8_gatelevel decoder (
        .in(sel),
        .out(sel_lines)
    );

    genvar i;
    generate
        for (i = 0; i < 7; i = i + 1) begin
            // AND Gates for MUX
            and_gate and0 (.a(d0[i]), .b(sel_lines[0]), .out(and_outputs[0][i]));
            and_gate and1 (.a(d1[i]), .b(sel_lines[1]), .out(and_outputs[1][i]));
            and_gate and2 (.a(d2[i]), .b(sel_lines[2]), .out(and_outputs[2][i]));
            and_gate and3 (.a(d3[i]), .b(sel_lines[3]), .out(and_outputs[3][i]));
            and_gate and4 (.a(d4[i]), .b(sel_lines[4]), .out(and_outputs[4][i]));
            and_gate and5 (.a(d5[i]), .b(sel_lines[5]), .out(and_outputs[5][i]));
            and_gate and6 (.a(d6[i]), .b(sel_lines[6]), .out(and_outputs[6][i]));
            and_gate and7 (.a(d7[i]), .b(sel_lines[7]), .out(and_outputs[7][i]));

            // OR Gate to Combine Outputs
            or_gate or_comb (
                .a(and_outputs[0][i]), .b(and_outputs[1][i]),
                .c(and_outputs[2][i]), .d(and_outputs[3][i]),
                .e(and_outputs[4][i]), .f(and_outputs[5][i]),
                .g(and_outputs[6][i]), .h(and_outputs[7][i]),
                .out(y[i])
            );
        end
    endgenerate
endmodule
