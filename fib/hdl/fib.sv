module fib(
    input logic clk,
    input logic rst,
    output logic [127:0] fib_out
);

logic [127:0] num1, num2;

always_ff @(posedge clk) begin
    if(rst) begin
        num1 <= 128'b0;
        num2 <= 128'b1;
    end else begin
        num1 <= num2;
        num2 <= fib_out;
    end
end

assign fib_out = num1 + num2;

endmodule