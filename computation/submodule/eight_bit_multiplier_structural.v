module eight_bit_multiplier_structural_module (
input [7:0] a,          // 8-bit 입력 a
input [7:0] b,          // 8-bit 입력 b
output [15:0] result
);

// Partial Products
wire [7:0] and_layer_0, and_layer_1, and_layer_2, and_layer_3;
wire [7:0] and_layer_4, and_layer_5, and_layer_6, and_layer_7;

// Intermediate Results and Carry
wire [15:0] partialSum1, partialSum2, partialSum3, partialSum4, partialSum5, partialSum6, partialSum7;
wire cout_1, cout_2, cout_3, cout_4, cout_5, cout_6;

// Step 1: Generate Partial Products
// Row 0 (a[7:0] * b[0])
and_gate and_00(.a(a[0]), .b(b[0]), .out(and_layer_0[0]));
and_gate and_10(.a(a[1]), .b(b[0]), .out(and_layer_0[1]));
and_gate and_20(.a(a[2]), .b(b[0]), .out(and_layer_0[2]));
and_gate and_30(.a(a[3]), .b(b[0]), .out(and_layer_0[3]));
and_gate and_40(.a(a[4]), .b(b[0]), .out(and_layer_0[4]));
and_gate and_50(.a(a[5]), .b(b[0]), .out(and_layer_0[5]));
and_gate and_60(.a(a[6]), .b(b[0]), .out(and_layer_0[6]));
and_gate and_70(.a(a[7]), .b(b[0]), .out(and_layer_0[7]));

// Layer 1 (a[7:0] * b[1])
and_gate and_01(.a(a[0]), .b(b[1]), .out(and_layer_1[0]));
and_gate and_11(.a(a[1]), .b(b[1]), .out(and_layer_1[1]));
and_gate and_21(.a(a[2]), .b(b[1]), .out(and_layer_1[2]));
and_gate and_31(.a(a[3]), .b(b[1]), .out(and_layer_1[3]));
and_gate and_41(.a(a[4]), .b(b[1]), .out(and_layer_1[4]));
and_gate and_51(.a(a[5]), .b(b[1]), .out(and_layer_1[5]));
and_gate and_61(.a(a[6]), .b(b[1]), .out(and_layer_1[6]));
and_gate and_71(.a(a[7]), .b(b[1]), .out(and_layer_1[7]));

// Layer 2 (a[7:0] * b[2])
and_gate and_02(.a(a[0]), .b(b[2]), .out(and_layer_2[0]));
and_gate and_12(.a(a[1]), .b(b[2]), .out(and_layer_2[1]));
and_gate and_22(.a(a[2]), .b(b[2]), .out(and_layer_2[2]));
and_gate and_32(.a(a[3]), .b(b[2]), .out(and_layer_2[3]));
and_gate and_42(.a(a[4]), .b(b[2]), .out(and_layer_2[4]));
and_gate and_52(.a(a[5]), .b(b[2]), .out(and_layer_2[5]));
and_gate and_62(.a(a[6]), .b(b[2]), .out(and_layer_2[6]));
and_gate and_72(.a(a[7]), .b(b[2]), .out(and_layer_2[7]));

// Layer 3 (a[7:0] * b[3])
and_gate and_03(.a(a[0]), .b(b[3]), .out(and_layer_3[0]));
and_gate and_13(.a(a[1]), .b(b[3]), .out(and_layer_3[1]));
and_gate and_23(.a(a[2]), .b(b[3]), .out(and_layer_3[2]));
and_gate and_33(.a(a[3]), .b(b[3]), .out(and_layer_3[3]));
and_gate and_43(.a(a[4]), .b(b[3]), .out(and_layer_3[4]));
and_gate and_53(.a(a[5]), .b(b[3]), .out(and_layer_3[5]));
and_gate and_63(.a(a[6]), .b(b[3]), .out(and_layer_3[6]));
and_gate and_73(.a(a[7]), .b(b[3]), .out(and_layer_3[7]));

// Layer 4 (a[7:0] * b[4])
and_gate and_04(.a(a[0]), .b(b[4]), .out(and_layer_4[0]));
and_gate and_14(.a(a[1]), .b(b[4]), .out(and_layer_4[1]));
and_gate and_24(.a(a[2]), .b(b[4]), .out(and_layer_4[2]));
and_gate and_34(.a(a[3]), .b(b[4]), .out(and_layer_4[3]));
and_gate and_44(.a(a[4]), .b(b[4]), .out(and_layer_4[4]));
and_gate and_54(.a(a[5]), .b(b[4]), .out(and_layer_4[5]));
and_gate and_64(.a(a[6]), .b(b[4]), .out(and_layer_4[6]));
and_gate and_74(.a(a[7]), .b(b[4]), .out(and_layer_4[7]));

// Layer 5 (a[7:0] * b[5])
and_gate and_05(.a(a[0]), .b(b[5]), .out(and_layer_5[0]));
and_gate and_15(.a(a[1]), .b(b[5]), .out(and_layer_5[1]));
and_gate and_25(.a(a[2]), .b(b[5]), .out(and_layer_5[2]));
and_gate and_35(.a(a[3]), .b(b[5]), .out(and_layer_5[3]));
and_gate and_45(.a(a[4]), .b(b[5]), .out(and_layer_5[4]));
and_gate and_55(.a(a[5]), .b(b[5]), .out(and_layer_5[5]));
and_gate and_65(.a(a[6]), .b(b[5]), .out(and_layer_5[6]));
and_gate and_75(.a(a[7]), .b(b[5]), .out(and_layer_5[7]));

// Layer 6 (a[7:0] * b[6])
and_gate and_06(.a(a[0]), .b(b[6]), .out(and_layer_6[0]));
and_gate and_16(.a(a[1]), .b(b[6]), .out(and_layer_6[1]));
and_gate and_26(.a(a[2]), .b(b[6]), .out(and_layer_6[2]));
and_gate and_36(.a(a[3]), .b(b[6]), .out(and_layer_6[3]));
and_gate and_46(.a(a[4]), .b(b[6]), .out(and_layer_6[4]));
and_gate and_56(.a(a[5]), .b(b[6]), .out(and_layer_6[5]));
and_gate and_66(.a(a[6]), .b(b[6]), .out(and_layer_6[6]));
and_gate and_76(.a(a[7]), .b(b[6]), .out(and_layer_6[7]));

// Layer 7 (a[7:0] * b[7])
and_gate and_07(.a(a[0]), .b(b[7]), .out(and_layer_7[0]));
and_gate and_17(.a(a[1]), .b(b[7]), .out(and_layer_7[1]));
and_gate and_27(.a(a[2]), .b(b[7]), .out(and_layer_7[2]));
and_gate and_37(.a(a[3]), .b(b[7]), .out(and_layer_7[3]));
and_gate and_47(.a(a[4]), .b(b[7]), .out(and_layer_7[4]));
and_gate and_57(.a(a[5]), .b(b[7]), .out(and_layer_7[5]));
and_gate and_67(.a(a[6]), .b(b[7]), .out(and_layer_7[6]));
and_gate and_77(.a(a[7]), .b(b[7]), .out(and_layer_7[7]));

// Step 2: Additions with Ripple Carry Adders
sixteen_bit_ripple_carry_adder_module first_step(
    .a({8'b00000000, and_layer_0}),
    .b({7'b0000000, and_layer_1, 1'b0}),
    .cin(1'b0),
    .sum(partialSum1),
    .cout(cout_1)
);

sixteen_bit_ripple_carry_adder_module second_step(
    .a(partialSum1),
    .b({6'b000000, and_layer_2, 2'b00}),
    .cin(cout_1),
    .sum(partialSum2),
    .cout(cout_2)
);

sixteen_bit_ripple_carry_adder_module third_step(
    .a(partialSum2),
    .b({5'b00000, and_layer_3, 3'b000}),
    .cin(cout_2),
    .sum(partialSum3),
    .cout(cout_3)
);

sixteen_bit_ripple_carry_adder_module fourth_step(
    .a(partialSum3),
    .b({4'b0000, and_layer_4, 4'b0000}),
    .cin(cout_3),
    .sum(partialSum4),
    .cout(cout_4)
);

sixteen_bit_ripple_carry_adder_module fifth_step(
    .a(partialSum4),
    .b({3'b000, and_layer_5, 5'b000}),
    .cin(cout_4),
    .sum(partialSum5),
    .cout(cout_5)
);

sixteen_bit_ripple_carry_adder_module sixth_step(
    .a(partialSum5),
    .b({2'b00, and_layer_6, 6'b000000}),
    .cin(cout_5),
    .sum(partialSum6),
    .cout(cout_6)
);

sixteen_bit_ripple_carry_adder_module seventh_step(
    .a(partialSum6),
    .b({1'b0, and_layer_7, 7'b0000000}),
    .cin(cout_6),
    .sum(partialSum7),
    .cout()
);

// Step 3: Assign Final Result
assign result = partialSum7;

endmodule
