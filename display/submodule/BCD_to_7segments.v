module BCD_to_7segment_gatelevel(
    input wire [3:0] BCD,  // 4-bit BCD input
    output wire A, B, C, D, E, F, G // 7-segment outputs
);

    // 내부 신호 정의
    wire not_BCD0, not_BCD1, not_BCD2, not_BCD3;
    wire and1, and2, and3, and4, and5, and6, and7;
    wire and8, and9, and10, and11, and12, and13, and14;

    // 입력 비트의 NOT 값 계산
    not_gate U0 (.A(BCD[0]), .Y(not_BCD0));
    not_gate U1 (.A(BCD[1]), .Y(not_BCD1));
    not_gate U2 (.A(BCD[2]), .Y(not_BCD2));
    not_gate U3 (.A(BCD[3]), .Y(not_BCD3));

    // A 출력 로직
    and_gate A0 (.A(not_BCD3), .B(not_BCD2), .C(not_BCD1), .D(BCD[0]), .Y(and1));
    and_gate A1 (.A(not_BCD3), .B(BCD[2]), .C(not_BCD1), .D(not_BCD0), .Y(and2));
    or_gate A2 (.A(and1), .B(and2), .Y(A));

    // B 출력 로직
    and_gate B0 (.A(not_BCD3), .B(BCD[2]), .C(not_BCD1), .D(BCD[0]), .Y(and3));
    and_gate B1 (.A(not_BCD3), .B(BCD[2]), .C(BCD[1]), .D(not_BCD0), .Y(and4));
    or_gate B2 (.A(and3), .B(and4), .Y(B));

    // C 출력 로직
    and_gate C0 (.A(not_BCD3), .B(not_BCD2), .C(BCD[1]), .D(not_BCD0), .Y(and5));
    or_gate C1 (.A(and5), .B(BCD[0]), .Y(C));

    // D 출력 로직
    and_gate D0 (.A(not_BCD3), .B(not_BCD2), .C(not_BCD1), .D(BCD[0]), .Y(and6));
    and_gate D1 (.A(not_BCD3), .B(BCD[2]), .C(not_BCD1), .D(not_BCD0), .Y(and7));
    or_gate D2 (.A(and6), .B(and7), .Y(D));

    // E 출력 로직
    and_gate E0 (.A(not_BCD3), .B(BCD[0]), .Y(and8));
    or_gate E1 (.A(and8), .B(BCD[2]), .Y(E));

    // F 출력 로직
    and_gate F0 (.A(not_BCD3), .B(not_BCD2), .C(BCD[0]), .Y(and9));
    and_gate F1 (.A(not_BCD3), .B(not_BCD2), .C(BCD[1]), .Y(and10));
    or_gate F2 (.A(and9), .B(and10), .Y(F));

    // G 출력 로직
    and_gate G0 (.A(not_BCD3), .B(not_BCD2), .C(not_BCD1), .Y(and11));
    and_gate G1 (.A(not_BCD3), .B(BCD[2]), .C(BCD[1]), .Y(and12));
    or_gate G2 (.A(and11), .B(and12), .Y(G));

endmodule
