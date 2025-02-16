module computation_module (
input [7:0] x0, x1, x2, x3, x4, x5, x6, x7,
input [7:0] w0, w1, w2, w3, w4, w5, w6, w7,
output [7:0] result
);

wire [15:0] o0, o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14;

// adding all the products
eight_bit_multiplier_structural_module ebm1 (.a(x0), .b(w0), .result(o0));

eight_bit_multiplier_structural_module ebm2 (.a(x1), .b(w1), .result(o1));
sixteen_bit_ripple_carry_adder_module sba1 (.a(o0), .b(o1), .cin(0), .sum(o2), .cout());

eight_bit_multiplier_structural_module ebm3 (.a(x2), .b(w2), .result(o3));
sixteen_bit_ripple_carry_adder_module sba2 (.a(o2), .b(o3), .cin(0), .sum(o4), .cout());

eight_bit_multiplier_structural_module ebm4 (.a(x3), .b(w3), .result(o5));
sixteen_bit_ripple_carry_adder_module sba3 (.a(o4), .b(o5), .cin(0), .sum(o6), .cout());

eight_bit_multiplier_structural_module ebm5 (.a(x4), .b(w4), .result(o7));
sixteen_bit_ripple_carry_adder_module sba4 (.a(o6), .b(o7), .cin(0), .sum(o8), .cout());

eight_bit_multiplier_structural_module ebm6 (.a(x5), .b(w5), .result(o9));
sixteen_bit_ripple_carry_adder_module sba5 (.a(o8), .b(o9), .cin(0), .sum(o10), .cout());

eight_bit_multiplier_structural_module ebm7 (.a(x6), .b(w6), .result(o11));
sixteen_bit_ripple_carry_adder_module sba6 (.a(o10), .b(o11), .cin(0), .sum(o12), .cout());

eight_bit_multiplier_structural_module ebm8 (.a(x7), .b(w7), .result(o13));
sixteen_bit_ripple_carry_adder_module sba7 (.a(o12), .b(o13), .cin(0), .sum(o14), .cout());

assign result = o14[7:0];

endmodule