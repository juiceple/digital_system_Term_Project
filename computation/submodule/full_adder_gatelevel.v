//This is for the 1-bit full adder module.

module full_adder_gatelevel_module (
input a, b, cin,
output sum, cout
);
wire xor_out_1;
wire xnor_out_1;
wire not_out_1;

wire and_out_1, and_out_2, and_out_3, and_out_4;
wire or_out_1;

// sum
not_gate not_1(.a(a), .out(not_out_1));

xor_gatelevel_gate xor_2(.a(b),.b(cin), .out(xor_out_1));
xnor_gatelevel_gate xnor_1(.a(b), .b(cin), .out(xnor_out_1));

and_gate and_1(.a(not_out_1), .b(xor_out_1), .out(and_out_1));
and_gate and_2(.a(a), .b(xnor_out_1), .out(and_out_2));
or_gate or_1(.a(and_out_1), .b(and_out_2), .out(sum));

// cout
and_gate and_3(.a(b),.b(cin),.out(and_out_3));
and_gate and_4(.a(not_out_1),.b(and_out_3),.out(and_out_4));
or_gate or_2(.a(b), .b(cin), .out(or_out_1));
and_gate and_5(.a(a), .b(or_out_1), .out(cout));

endmodule