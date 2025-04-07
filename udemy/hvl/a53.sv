module a53;

    logic [5:0] addr;
    logic en;
    logic wr;

    logic clk;

    initial begin
        clk = 0;
        forever #20 clk = ~clk;
    end


    task gen_stim();
        @(posedge clk);
        en = 1'b1;
        wr = 1'b1;
        addr = 6'd12;
        $display("Address: %0d | Enable: %0d | Write Enable: %0d", addr, en, wr);
        @(posedge clk);
        addr = 6'd14;
        $display("Address: %0d | Enable: %0d | Write Enable: %0d", addr, en, wr);
        @(posedge clk);
        wr = 1'b0;
        addr = 6'd23;
        $display("Address: %0d | Enable: %0d | Write Enable: %0d", addr, en, wr);
        @(posedge clk);
        addr = 6'd48;  
        $display("Address: %0d | Enable: %0d | Write Enable: %0d", addr, en, wr);
        @(posedge clk);
        en = 1'b0;
        addr = 6'd56;
        $display("Address: %0d | Enable: %0d | Write Enable: %0d", addr, en, wr);
    endtask

    initial begin
        gen_stim();
        $finish;
    end


endmodule