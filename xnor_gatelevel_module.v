module xnor_gatelevel_gate (
    input a, b,
    output out
);

    wire not_a_out, not_b_out;
    wire and_1_out, and_2_out;

    //Fill this out
    //Boolean expression을 그대로 인스턴스화를 활용하여 적어보았다.
    // NOT 게이트 인스턴스화
    not_gate NOT1 (.a(a), .out(not_a_out));
    not_gate NOT2 (.a(b), .out(not_b_out));

    // AND 게이트 인스턴스화
    and_gate AND1 (.a(not_a_out), .b(not_b_out), .out(and_1_out));
    and_gate AND2 (.a(a), .b(b), .out(and_2_out));

    // OR 게이트 인스턴스화
    or_gate OR1 (.a(and_1_out), .b(and_2_out), .out(out));

    

endmodule