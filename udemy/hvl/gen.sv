// Transaction gener
class gener;
  rand bit [3:0] a, b;
  bit [3:0] expected_y;

  constraint valid_range {
    a inside {[0:15]};
    b inside {[0:15]};
  }

  function new();
  endfunction
endclass

// Functional Coverage
covergroup cg(ref logic [3:0] a, ref logic [3:0] b, ref logic [3:0] expected_y);
  coverpoint a {
    bins all_values[] = {[0:15]};
  }
  coverpoint b {
    bins all_values[] = {[0:15]};
  }
  coverpoint expected_y {
    bins all_values[] = {[0:15]};
  }
endgroup

module gen_top;
  
  gener g; // gener Handler
  int i = 0;
  
  logic [3:0] a, b, y; // Logic signals for DUT connection
  logic [3:0] expected_y; // Expected output

  // Instantiate DUT
  and_gate d(
    .a(a),
    .b(b),
    .y(y)
  );

  // Instantiate coverage group with references to variables
  cg coverage = new(a, b, expected_y);

  initial begin
    g = new();

    for (i = 0; i < 100; i++) begin
      if (!g.randomize()) 
        $fatal("Randomization failed");
      
      a = g.a; // Assign class values to logic signals
      b = g.b;
      expected_y = a & b; // Example logic: DUT should perform AND operation

      #5; // Small delay before checking results
      $display("Iteration %0d: a = %0b, b = %0b, y = %0b (Expected: %0b)", i, a, b, y, expected_y);
      
      // DUT Verification
      if (y !== expected_y) begin
        $error("Mismatch! DUT Output: %0b, Expected: %0b", y, expected_y);
      end

      // Coverage Collection
      coverage.sample();

      #10;
    end

    // Report Final Coverage
    $display("Functional Coverage Report:");
    $display("%m Coverage: %0.2f%%", coverage.get_inst_coverage());
    $stop;
  end
endmodule


