module sixteen_bit_ripple_carry_adder_module (
input [15:0] a, b,      // 16-bit intput a,b
input cin,              // in put carry In
output [15:0] sum,      // 16-bit sum
output cout             // final carry out
);

wire cout_1, cout_2, cout_3, cout_4, cout_5, cout_6, cout_7;
wire cout_8, cout_9, cout_10, cout_11, cout_12, cout_13, cout_14, cout_15; // intermediate carry

// 16 1-bit full adder connections
full_adder_gatelevel_module full_adder_0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(cout_1));
full_adder_gatelevel_module full_adder_1(.a(a[1]), .b(b[1]), .cin(cout_1), .sum(sum[1]), .cout(cout_2));
full_adder_gatelevel_module full_adder_2(.a(a[2]), .b(b[2]), .cin(cout_2), .sum(sum[2]), .cout(cout_3));
full_adder_gatelevel_module full_adder_3(.a(a[3]), .b(b[3]), .cin(cout_3), .sum(sum[3]), .cout(cout_4));
full_adder_gatelevel_module full_adder_4(.a(a[4]), .b(b[4]), .cin(cout_4), .sum(sum[4]), .cout(cout_5));
full_adder_gatelevel_module full_adder_5(.a(a[5]), .b(b[5]), .cin(cout_5), .sum(sum[5]), .cout(cout_6));
full_adder_gatelevel_module full_adder_6(.a(a[6]), .b(b[6]), .cin(cout_6), .sum(sum[6]), .cout(cout_7));
full_adder_gatelevel_module full_adder_7(.a(a[7]), .b(b[7]), .cin(cout_7), .sum(sum[7]), .cout(cout_8));
full_adder_gatelevel_module full_adder_8(.a(a[8]), .b(b[8]), .cin(cout_8), .sum(sum[8]), .cout(cout_9));
full_adder_gatelevel_module full_adder_9(.a(a[9]), .b(b[9]), .cin(cout_9), .sum(sum[9]), .cout(cout_10));
full_adder_gatelevel_module full_adder_10(.a(a[10]), .b(b[10]), .cin(cout_10), .sum(sum[10]), .cout(cout_11));
full_adder_gatelevel_module full_adder_11(.a(a[11]), .b(b[11]), .cin(cout_11), .sum(sum[11]), .cout(cout_12));
full_adder_gatelevel_module full_adder_12(.a(a[12]), .b(b[12]), .cin(cout_12), .sum(sum[12]), .cout(cout_13));
full_adder_gatelevel_module full_adder_13(.a(a[13]), .b(b[13]), .cin(cout_13), .sum(sum[13]), .cout(cout_14));
full_adder_gatelevel_module full_adder_14(.a(a[14]), .b(b[14]), .cin(cout_14), .sum(sum[14]), .cout(cout_15));
full_adder_gatelevel_module full_adder_15(.a(a[15]), .b(b[15]), .cin(cout_15), .sum(sum[15]), .cout(cout));

endmodule