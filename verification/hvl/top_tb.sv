// `include memory_itf.sv"

class packet;
    randc logic [5:0] addr;
    rand logic [7:0] w_data;
endclass

class driver;
    virtual memory_itf mem_itf;

    // Constructor to assign the virtual interface
    function new(virtual memory_itf mem_if_instance);
        this.mem_itf = mem_if_instance;
    endfunction

    function void write_to_memory(packet p);
        p.randomize();
        mem_itf.addr = p.addr;
        mem_itf.wr = 1'b1;
        mem_itf.en = 1'b1;
        mem_itf.w_data = p.w_data;
        $display("Value Written to 0x%0h: 0x%0h", mem_itf.addr, mem_itf.w_data);
    endfunction

    function void read_from_memory(packet p);
        mem_itf.addr = p.addr;
        mem_itf.wr = 1'b0;
        mem_itf.en = 1'b1;
    endfunction
endclass

class sequencer;
    
endclass

module top_tb;


    timeunit 1ps;
    timeprecision 1ps;

    bit clk;
    bit rst;
    always #(500) clk = ~clk;

    // Declare the interface instance
    memory_itf mem_itf(.*);

    memory memory(
        .clk(clk),
        .rst(rst),
        .en(mem_itf.en),
        .wr(mem_itf.wr),
        .addr(mem_itf.addr),
        .w_data(mem_itf.w_data),
        .r_data(mem_itf.r_data)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        $fsdbDumpfile("dump.fsdb");
        $fsdbDumpvars(0, "+all");
        rst = 1'b1;
        repeat (2) @(posedge clk);
        rst <= 1'b0;
    end

    // Instantiate driver and packet
    driver drv;
    packet pkt = new();

    initial begin
        // Pass the interface to the driver
        drv = new(mem_itf);
        @(negedge rst);

        @(posedge clk);
        // Perform write operation
        drv.write_to_memory(pkt);
        @(posedge clk);

        drv.read_from_memory(pkt);
        repeat(5) @(posedge clk);
        $display("Value Read at 0x%0h: 0x%0h", mem_itf.addr, mem_itf.r_data);
        $finish();
    end


endmodule
