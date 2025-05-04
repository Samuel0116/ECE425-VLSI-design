module tb;

    logic   A;
    logic   Y;

    inv dut(
        .A(A),
        .Y(Y)
    );

    initial begin
        $fsdbDumpfile("dump.fsdb");
        $fsdbDumpvars(0, "+all");
        A <= 1'b0;
        #1ns;
        A <= 1'b1;
        #1ns;
        A <= 1'b0;
        #1ns;
        $finish;
    end

endmodule
