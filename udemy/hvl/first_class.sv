class first;

    // Data Members
    logic [2:0] data;
    logic [1:0] data2;

    // Default Constructor
    function new();
        data = 3'b101;
        data2 = 2'b00;
    endfunction

    // Copy Constructor
    function copy(first obj);
        data = obj.data;
        data2 = obj.data2;
    endfunction

endclass

module top_tb2;

    first f;
    first f2;

    initial begin
        f = new(); // Constructor
        f2 = new();
        f2.copy(f);
        f = null;
        #1;
        $display("Value of data : %0d and data2 : %0d", f2.data, f2.data2);
        $finish;

    end

endmodule