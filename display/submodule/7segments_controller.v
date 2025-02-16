module seven_segment_controller_structural (
    input clk, rst,
    input [6:0] seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7, // 각 디스플레이의 세그먼트 값
    output [7:0] com,    // Common 신호
    output [6:0] seven_seg // 현재 활성화된 디스플레이의 데이터
);

    wire [2:0] cnt_scan; // 3비트 카운터 출력

    // 3비트 카운터 인스턴스
    counter_3bit_structural counter (
        .clk(clk),
        .rst(rst),
        .count(cnt_scan)
    );

    // MUX를 사용하여 com 신호 및 seven_seg 선택
    com_decoder com_dec (
        .cnt_scan(cnt_scan),
        .com(com)
    );

    seg_mux seg_decoder (
        .cnt_scan(cnt_scan),
        .seg0(seg0), .seg1(seg1), .seg2(seg2), .seg3(seg3),
        .seg4(seg4), .seg5(seg5), .seg6(seg6), .seg7(seg7),
        .seven_seg(seven_seg)
    );

endmodule
