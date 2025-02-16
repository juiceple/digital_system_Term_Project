module display_module (
    input clk,                  // Clock
    input rst,                  // Reset
    input [7:0] binary_value,   // 8-bit binary input
    output [7:0] com,           // Common signals for 7-segment display
    output [6:0] seven_seg      // 7-segment display output
);

    // Intermediate wires for BCD and 7-segment outputs
    wire [11:0] BCD_code;       // 12-bit BCD output (Hundreds, Tens, Units)
    wire [6:0] seg0, seg1, seg2; // 7-segment outputs for Hundreds, Tens, Units

    // Binary to BCD Converter
    binary_to_BCD_converter_structural_module binary_to_BCD (
        .eight_bit_input(binary_value),
        .BCD_code(BCD_code)
    );

    // BCD to 7-Segment Converters
    BCD_to_7segment_gatelevel BCD_to_7seg_hundreds (
        .BCD(BCD_code[11:8]),   // Hundreds digit
        .A(seg0[0]), .B(seg0[1]), .C(seg0[2]),
        .D(seg0[3]), .E(seg0[4]), .F(seg0[5]), .G(seg0[6])
    );

    BCD_to_7segment_gatelevel BCD_to_7seg_tens (
        .BCD(BCD_code[7:4]),    // Tens digit
        .A(seg1[0]), .B(seg1[1]), .C(seg1[2]),
        .D(seg1[3]), .E(seg1[4]), .F(seg1[5]), .G(seg1[6])
    );

    BCD_to_7segment_gatelevel BCD_to_7seg_units (
        .BCD(BCD_code[3:0]),    // Units digit
        .A(seg2[0]), .B(seg2[1]), .C(seg2[2]),
        .D(seg2[3]), .E(seg2[4]), .F(seg2[5]), .G(seg2[6])
    );

    // 7-Segment Controller
    seven_segment_controller_structural seven_seg_ctrl (
        .clk(clk),
        .rst(rst),
        .seg0(seg0), 
        .seg1(seg1), 
        .seg2(seg2), 
        .seg3(7'b0000000), 
        .seg4(7'b0000000), 
        .seg5(7'b0000000), 
        .seg6(7'b0000000), 
        .seg7(7'b0000000),
        .com(com),
        .seven_seg(seven_seg)
    );

endmodule
