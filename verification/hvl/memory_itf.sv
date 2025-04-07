interface memory_itf #(
    parameter DEPTH = 64,
    parameter WIDTH = 8,
    parameter ADDR_WIDTH = $clog2(DEPTH)
)(
    input logic clk,
    input logic rst
);

    logic [ADDR_WIDTH-1:0] addr;
    logic                  en;
    logic                  wr;
    logic [WIDTH-1:0]      w_data;
    logic [WIDTH-1:0]      r_data;

    modport mem (
        input  clk,
        input  rst,
        input  addr,
        input  en,
        input  wr,
        input  w_data,
        output r_data
    );

endinterface
