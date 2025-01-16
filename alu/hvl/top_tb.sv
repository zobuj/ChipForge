module top_tb;

    localparam WIDTH = 32;

    logic [WIDTH-1:0] operand_a;
    logic [WIDTH-1:0] operand_b;
    logic [WIDTH-1:0] result;

    alu #(
        .WIDTH(WIDTH)
    ) uut (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result(result)
    );

    initial begin
        operand_a = 32'd1;
        operand_b = 32'd2;
        $display("Result: %0d", result);
        $finish;
    end

endmodule