function int generate_clock(input int hz);
    return 1000000 / hz;
endfunction

module top_tb;


    timeunit 1ps;
    timeprecision 1ps;
    
    bit clk;
    int half_period_100Mhz = generate_clock(100) / 2;
    always #(half_period_100Mhz) clk = ~clk;

    bit rst;
    initial begin
        rst = 1'b1;
        #(2*half_period_100Mhz);
        rst = 1'b0;
    end

    logic wr;
    logic [9:0] addr;
    logic [7:0] data_in;
    logic [7:0] data_out;

    ram ram(
        .clk(clk),
        .rst(rst),
        .wr(wr),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    task write_to_mem(input logic [9:0] address, input logic [7:0] data);
        begin
            @(posedge clk);
            addr = address;
            data_in = data;
            wr = 1'b1;
            @(posedge clk);
            wr = 1'b0;
        end
    endtask

    task read_from_mem(input logic [9:0] address, output logic [7:0] data);
        begin
            @(posedge clk);
            addr = address;
            wr = 1'b0;
            @(posedge clk);
            data = data_out;
        end
    endtask

    logic [7:0] tmp_data;

    initial begin
        @(negedge rst);
        write_to_mem(10'hFF,8'hEC);
        write_to_mem(10'h100,8'hEB);

        read_from_mem(10'hFF,tmp_data);
        $display("Data at 0xFF: 0x%0h", tmp_data);
        read_from_mem(10'h100,tmp_data);
        $display("Data at 0x100: 0x%0h", tmp_data);

        $finish();
    end
    

endmodule