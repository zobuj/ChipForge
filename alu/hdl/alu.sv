module alu #(
    parameter WIDTH=8
)(
    input logic [WIDTH-1:0] operand_a,
    input logic [WIDTH-1:0] operand_b,
    output logic [WIDTH-1:0] result
);

    assign result = operand_a + operand_b;

endmodule