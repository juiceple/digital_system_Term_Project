`timescale 1ns / 1ps

module top_module (
    input clk,                  // Clock
    input rst,                  // Reset
    input en,                   // Enable
    input init,                 // Initialize the controller
    input [127:0] in_data,      // 128-bit input data
    output [6:0] seven_seg,     // 7-segment display output
    output [7:0] com            // Common signals for 7-segment display
);

    // Internal signals
    wire [127:0] mem_out;        // Output from memory module
    wire [7:0] computation_result; // Result from computation module
    wire [127:0] mem_input_mux;  // Mux output for memory input
    wire [7:0] display_mux;      // Mux output for display
    wire mode, mem_en;           // Control signals for memory
    wire [1:0] state, next_state; // Current and next state of the controller
    wire [1:0] controller_out;   // Controller output

    // Controller module (structural)
    controller_module ctrl_inst (
        .clk(clk),
        .rst(rst),
        .init(init),
        .out(controller_out),
        .state(state),
        .next_state(next_state)
    );

    // Mux for memory input
    mux2_1_128bit mem_input_mux_inst (
        .a(128'b0),           // Default value for S2 and S3
        .b(in_data),          // Input data for S0 and S1
        .sel(controller_out == 2'b00 || controller_out == 2'b01), // Select based on state
        .out(mem_input_mux)
    );

    // Memory module
    memory_module mem_inst (
        .in(mem_input_mux),
        .clk(clk),
        .rst(rst),
        .en(mem_en),
        .mode(mode),
        .out(mem_out)
    );

    // Memory control logic
    and_gate mem_enable_logic (
        .a(en),
        .b(controller_out != 2'b00), // Enable for S1, S2, S3
        .out(mem_en)
    );

    or_gate mem_mode_logic (
        .a(controller_out == 2'b01), // Write mode for S1
        .b(1'b0),                    // Read mode for others
        .out(mode)
    );

    // Computation module
    computation_module comp_inst (
        .x0(mem_out[7:0]), 
        .x1(mem_out[15:8]), 
        .x2(mem_out[23:16]), 
        .x3(mem_out[31:24]), 
        .x4(mem_out[39:32]), 
        .x5(mem_out[47:40]), 
        .x6(mem_out[55:48]), 
        .x7(mem_out[63:56]),
        .w0(mem_out[71:64]), 
        .w1(mem_out[79:72]), 
        .w2(mem_out[87:80]), 
        .w3(mem_out[95:88]), 
        .w4(mem_out[103:96]), 
        .w5(mem_out[111:104]), 
        .w6(mem_out[119:112]), 
        .w7(mem_out[127:120]),
        .result(computation_result)
    );

    // Mux for display
    mux2_1_8bit display_mux_inst (
        .a(mem_out[7:0]),          // Display memory data for S1
        .b(computation_result),    // Display computation result for S3
        .sel(controller_out == 2'b11), // Select based on state
        .out(display_mux)
    );

    // Display module
    display_module disp_inst (
        .clk(clk),
        .rst(rst),
        .binary_value(display_mux),
        .com(com),
        .seven_seg(seven_seg)
    );

endmodule

// Supporting Modules

// 128-bit 2:1 Mux
module mux2_1_128bit (
    input [127:0] a, b,   // Inputs
    input sel,            // Select signal
    output [127:0] out    // Output
);
    assign out = sel ? b : a;
endmodule

// 8-bit 2:1 Mux
module mux2_1_8bit (
    input [7:0] a, b,     // Inputs
    input sel,            // Select signal
    output [7:0] out      // Output
);
    assign out = sel ? b : a;
endmodule

// AND Gate
module and_gate (
    input a, b,           // Inputs
    output out            // Output
);
    assign out = a & b;
endmodule

// OR Gate
module or_gate (
    input a, b,           // Inputs
    output out            // Output
);
    assign out = a | b;
endmodule
