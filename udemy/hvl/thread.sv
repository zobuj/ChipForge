module thread;

    initial begin
        for(int i=0;i<5;i++) begin
            fork
                automatic int local_i = i;
                thread(local_i);
            join_none
        end
        wait fork;
    end

    task thread(int index);
        $display("Thread index: %0d", index);
    endtask


endmodule