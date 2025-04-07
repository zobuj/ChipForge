module top_tb1;

    int unsigned var1;
    int unsigned var2;
    int unsigned result;

    function int unsigned multiply(int unsigned x, int unsigned y);
        return x * y;
    endfunction

    initial begin
        var1 = 20;
        var2 = 10;
        result = multiply(var1,var2);
        $display("multiply(var1,var2) = %0d", result);

        named_assertion: assert (result == 200 && (var1 == 20 || var2 == 10))
        else $error("Unexpected result for inputs: var1=%0d, var2=%0d", var1, var2);

        $finish;
    end

endmodule