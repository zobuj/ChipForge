module top_tb;

    logic clk = 1'b0;  // Initialize clock
    logic rst;
    logic [127:0] fib_out;

    always #2 clk = ~clk; // Clock period = 4 time units

    initial begin
        rst = 1'b1;
        #10;         // Hold reset for longer to ensure proper initialization
        rst = 1'b0;
    end

    fib dut(
        .clk(clk),
        .rst(rst),
        .fib_out(fib_out)
    );
    
    initial begin
        $monitor("Time: %0t | fib_out: %0d", $time, fib_out);
        #2000;  // 500 clock cycles * 4 time units per cycle
        $finish;
    end

endmodule
