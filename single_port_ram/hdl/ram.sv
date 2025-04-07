module ram(
    input  logic clk,
    input  logic rst,
    input  logic wr,
    input  logic [9:0] addr,
    input  logic [7:0] data_in,
    output logic [7:0] data_out
);

    logic [7:0] ram_arr[0:1024];

    always_ff @(posedge clk) begin
        if(rst) begin
            ram_arr <= '{default: 8'h0};
        end else begin
            if(wr) begin
                ram_arr[addr] <= data_in;
            end
        end
    end

    assign data_out = !wr ? ram_arr[addr] : '0;

endmodule