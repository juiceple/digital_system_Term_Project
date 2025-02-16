module submodule_gatelevel_module (
    input [3:0] in,
    output [3:0] out
);
    /*
        Boolean expressions: Sum Of Products (SOP)
        in[3] = A, in[2] = B, in[1] = C, in[0] = D
        out[3] = A+BC+BD
        out[2] = AD+BC'D'
        out[1] = B'C+CD+AD' = (B'+D)C+AD'
        out[0] =  A'B'D+A'BCD'+AB'C'D'
    */
    /*
    �ʰ� �� �� �ִ� free�� wire�� and_8_out, and_9_out, and_10_out; or_2_out;
    */

    wire not_1_out, not_2_out, not_3_out, not_4_out, not_5_out;
    wire and_1_out, and_2_out, and_3_out, and_4_out, and_5_out, and_6_out, and_7_out, and_8_out, and_9_out, and_10_out;
    wire or_1_out, or_2_out;

    not_gate not_1(.a(in[3]), .out(not_1_out)); // A'
    not_gate not_2(.a(in[2]), .out(not_2_out)); // B'
    not_gate not_3(.a(in[1]), .out(not_3_out)); // C'
    not_gate not_4(.a(in[0]), .out(not_4_out)); // D'

    // out[3]
    and_gate and_1(.a(in[2]), .b(in[1]), .out(and_1_out)); // BC
    and_gate and_2(.a(in[2]), .b(in[0]), .out(and_2_out)); // BD
    or_gate or_1(.a(in[3]), .b(and_1_out), .out(or_1_out)); // A+BC
    or_gate or_2(.a(or_1_out), .b(and_2_out), .out(out[3]));

    // out[2]
    and_gate and_3(.a(in[3]), .b(in[0]), .out(and_3_out)); // AD
    and_gate and_4(.a(in[2]), .b(not_4_out), .out(and_4_out)); // BD'
    and_gate and_5(.a(and_4_out), .b(not_3_out), .out(and_5_out)); // BC'D'
    or_gate or_3(.a(and_3_out), .b(and_5_out), .out(out[2]));

    // out[1]
    not_gate not_5(.a(and_4_out), .out(not_5_out)); // B'+D
    and_gate and_6(.a(not_5_out), .b(in[1]), .out(and_6_out)); // (B'+D)C
    and_gate and_7(.a(in[3]), .b(not_4_out), .out(and_7_out)); // AD'
    or_gate or_4(.a(and_6_out), .b(and_7_out), .out(out[1])); 

    // out[0]
    // Fill this out
    //AD' and_7_out

    //A'B'D
    and_gate and_8(.a(not_1_out), .b(not_2_out), .out(and_8_out));
    and_gate and_9(.a(and_8_out),.b(in[0]), .out(and_9_out));
    //BCD'
    and_gate and_10(.a(and_1_out),.b(not_4_out),.out(and_10_out));

    //��ġ��
    or_gate or_5(.a(and_7_out), .b(and_9_out), .out(or_2_out));
    or_gate or_6(.a(or_2_out), .b(and_10_out), .out(out[0]));
endmodule