module binary_to_BCD_converter_structural_module (
    input [7:0] eight_bit_input,
    output [11:0] BCD_code
);
    wire [18:0] t;

    assign BCD_code[0] = eight_bit_input[0];
    assign BCD_code[11:10]= 2'b00

    // Submodule to hunds, tens, units
    submodule_gatelevel_module C1 (.in({1'b0, eight_bit_input[7:5]}), .out(t[3:0]));
    submodule_gatelevel_module C2 (.in({t[2:0], eight_bit_input[4]}), .out(t[7:4]));
    submodule_gatelevel_module C3 (.in({t[6:4], eight_bit_input[3]}), .out(t[11:8]));
    submodule_gatelevel_module C4 (.in({t[10:8], eight_bit_input[2]}), .out(t[15:12]));
    submodule_gatelevel_module C5 (.in({t[14:12], eight_bit_input[1]}), .out(BCD_code[4:1]));
    submodule_gatelevel_module C6 (.in({1'b0, eight_bit_input[3], eight_bit_input[7], eight_bit_input[11]}), .out({BCD_code[9], t[18:16]}));
    submodule_gatelevel_module C7 (.in(t[18:15]), .out(BCD_code[8:5]));
endmodule
