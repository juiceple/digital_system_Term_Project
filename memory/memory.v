module memory_module (
    input [127:0] in,       // 128-bit input data (16 x 8-bit elements)
    input clk, rst, en, mode,   // Clock, reset, enable, and mode (1: write, 0: read)
    output [127:0] out      // 128-bit output data (16 x 8-bit elements)
);

    // Define 16 8-bit memory registers
    reg [7:0] mem [0:15];   // Memory array
    wire [7:0] q [0:15];    // Outputs of each 8-bit D flip-flop
    wire write_enable, read_enable;
    wire not_mode;
    wire [127:0] mux_out;

    // Instantiate control logic
    not_gate notmode (.a(mode), .out(not_mode));
    and_gate writeenable (.a(en), .b(mode), .out(write_enable));
    and_gate readenable (.a(en), .b(not_mode), .out(read_enable));

    // Instantiate 8-bit D flip-flops for each memory element
    d_flip_flop_8bit mem0 (.d(write_enable ? in[7:0] : mem[0]), .clk(clk), .rst(rst), .en(en), .q(q[0]));
    d_flip_flop_8bit mem1 (.d(write_enable ? in[15:8] : mem[1]), .clk(clk), .rst(rst), .en(en), .q(q[1]));
    d_flip_flop_8bit mem2 (.d(write_enable ? in[23:16] : mem[2]), .clk(clk), .rst(rst), .en(en), .q(q[2]));
    d_flip_flop_8bit mem3 (.d(write_enable ? in[31:24] : mem[3]), .clk(clk), .rst(rst), .en(en), .q(q[3]));
    d_flip_flop_8bit mem4 (.d(write_enable ? in[39:32] : mem[4]), .clk(clk), .rst(rst), .en(en), .q(q[4]));
    d_flip_flop_8bit mem5 (.d(write_enable ? in[47:40] : mem[5]), .clk(clk), .rst(rst), .en(en), .q(q[5]));
    d_flip_flop_8bit mem6 (.d(write_enable ? in[55:48] : mem[6]), .clk(clk), .rst(rst), .en(en), .q(q[6]));
    d_flip_flop_8bit mem7 (.d(write_enable ? in[63:56] : mem[7]), .clk(clk), .rst(rst), .en(en), .q(q[7]));
    d_flip_flop_8bit mem8 (.d(write_enable ? in[71:64] : mem[8]), .clk(clk), .rst(rst), .en(en), .q(q[8]));
    d_flip_flop_8bit mem9 (.d(write_enable ? in[79:72] : mem[9]), .clk(clk), .rst(rst), .en(en), .q(q[9]));
    d_flip_flop_8bit mem10 (.d(write_enable ? in[87:80] : mem[10]), .clk(clk), .rst(rst), .en(en), .q(q[10]));
    d_flip_flop_8bit mem11 (.d(write_enable ? in[95:88] : mem[11]), .clk(clk), .rst(rst), .en(en), .q(q[11]));
    d_flip_flop_8bit mem12 (.d(write_enable ? in[103:96] : mem[12]), .clk(clk), .rst(rst), .en(en), .q(q[12]));
    d_flip_flop_8bit mem13 (.d(write_enable ? in[111:104] : mem[13]), .clk(clk), .rst(rst), .en(en), .q(q[13]));
    d_flip_flop_8bit mem14 (.d(write_enable ? in[119:112] : mem[14]), .clk(clk), .rst(rst), .en(en), .q(q[14]));
    d_flip_flop_8bit mem15 (.d(write_enable ? in[127:120] : mem[15]), .clk(clk), .rst(rst), .en(en), .q(q[15]));  
   
    assign out_reset = 128'b0;
       
    assign mux_out[7:0]     = (en == 1'b0) ? out_reset : (read_enable ? q[0] : 8'b0);    
    assign mux_out[15:8]    = (en == 1'b0) ? out_reset : (read_enable ? q[1] : 8'b0);  
    assign mux_out[23:16]   = (en == 1'b0) ? out_reset : (read_enable ? q[2] : 8'b0);  
    assign mux_out[31:24]   = (en == 1'b0) ? out_reset : (read_enable ? q[3] : 8'b0);  
    assign mux_out[39:32]   = (en == 1'b0) ? out_reset : (read_enable ? q[4] : 8'b0);  
    assign mux_out[47:40]   = (en == 1'b0) ? out_reset : (read_enable ? q[5] : 8'b0);  
    assign mux_out[55:48]   = (en == 1'b0) ? out_reset : (read_enable ? q[6] : 8'b0);  
    assign mux_out[63:56]   = (en == 1'b0) ? out_reset : (read_enable ? q[7] : 8'b0);  
    assign mux_out[71:64]   = (en == 1'b0) ? out_reset : (read_enable ? q[8] : 8'b0);  
    assign mux_out[79:72]   = (en == 1'b0) ? out_reset : (read_enable ? q[9] : 8'b0);  
    assign mux_out[87:80]   = (en == 1'b0) ? out_reset : (read_enable ? q[10] : 8'b0);  
    assign mux_out[95:88]   = (en == 1'b0) ? out_reset : (read_enable ? q[11] : 8'b0);  
    assign mux_out[103:96]  = (en == 1'b0) ? out_reset : (read_enable ? q[12] : 8'b0);  
    assign mux_out[111:104] = (en == 1'b0) ? out_reset : (read_enable ? q[13] : 8'b0);  
    assign mux_out[119:112] = (en == 1'b0) ? out_reset : (read_enable ? q[14] : 8'b0);
    assign mux_out[127:120] = (en == 1'b0) ? out_reset : (read_enable ? q[15] : 8'b0);  
   
    d_flip_flop_8bit out_ff0 (.d(mux_out[7:0]), .clk(clk), .rst(rst), .en(1'b1), .q(out[7:0]));
    d_flip_flop_8bit out_ff1 (.d(mux_out[15:8]), .clk(clk), .rst(rst), .en(1'b1), .q(out[15:8]));
    d_flip_flop_8bit out_ff2 (.d(mux_out[23:16]), .clk(clk), .rst(rst), .en(1'b1), .q(out[23:16]));
    d_flip_flop_8bit out_ff3 (.d(mux_out[31:24]), .clk(clk), .rst(rst), .en(1'b1), .q(out[31:24]));
    d_flip_flop_8bit out_ff4 (.d(mux_out[39:32]), .clk(clk), .rst(rst), .en(1'b1), .q(out[39:32]));
    d_flip_flop_8bit out_ff5 (.d(mux_out[47:40]), .clk(clk), .rst(rst), .en(1'b1), .q(out[47:40]));
    d_flip_flop_8bit out_ff6 (.d(mux_out[55:48]), .clk(clk), .rst(rst), .en(1'b1), .q(out[55:48]));
    d_flip_flop_8bit out_ff7 (.d(mux_out[63:56]), .clk(clk), .rst(rst), .en(1'b1), .q(out[63:56]));
    d_flip_flop_8bit out_ff8 (.d(mux_out[71:64]), .clk(clk), .rst(rst), .en(1'b1), .q(out[71:64]));
    d_flip_flop_8bit out_ff9 (.d(mux_out[79:72]), .clk(clk), .rst(rst), .en(1'b1), .q(out[79:72]));
    d_flip_flop_8bit out_ff10 (.d(mux_out[87:80]), .clk(clk), .rst(rst), .en(1'b1), .q(out[87:80]));
    d_flip_flop_8bit out_ff11 (.d(mux_out[95:88]), .clk(clk), .rst(rst), .en(1'b1), .q(out[95:88]));
    d_flip_flop_8bit out_ff12 (.d(mux_out[103:96]), .clk(clk), .rst(rst), .en(1'b1), .q(out[103:96]));
    d_flip_flop_8bit out_ff13 (.d(mux_out[111:104]), .clk(clk), .rst(rst), .en(1'b1), .q(out[111:104]));
    d_flip_flop_8bit out_ff14 (.d(mux_out[119:112]), .clk(clk), .rst(rst), .en(1'b1), .q(out[119:112]));
    d_flip_flop_8bit out_ff15 (.d(mux_out[127:120]), .clk(clk), .rst(rst), .en(1'b1), .q(out[127:120]));
 
 
endmodule