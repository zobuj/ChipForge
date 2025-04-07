module memory #(parameter WIDTH = 8, DEPTH = 64) (
    input logic clk,
    input logic rst,
    input logic en,
    input logic wr,
    input logic [$clog2(DEPTH)-1:0] addr,
    input logic [WIDTH-1:0] w_data,
    output logic [WIDTH-1:0] r_data
);

    logic [WIDTH-1:0] mem [0:DEPTH-1];

    // Write Operation
    always_ff @(posedge clk) begin
        if (rst) begin
            for (int i = 0; i < DEPTH; i++) begin
                mem[i] <= '0;
            end
        end else if (en && wr) begin
            mem[addr] <= w_data;
        end
    end

    // Read Operation
    always_comb begin
        if (en && !wr) begin
            r_data = mem[addr];
        end else begin
            r_data = '0; // Default output
        end
    end
endmodule
