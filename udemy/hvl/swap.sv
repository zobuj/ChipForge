class deeper;

  logic [7:0] d;

  function deeper copy();
    copy = new();
    copy.d = d;
    return copy;
  endfunction

endclass

class second;
  
  logic [7:0] a;
  logic [7:0] b;
  logic [7:0] c;

  deeper d1;
  
  function new(input logic [7:0] a = 8'h00, input logic [7:0] b = 8'h00, input logic [7:0] c = 8'h00);
   this.a = a;
   this.b = b;
   this.c = c;
   this.d1 = new();    
  endfunction

  function second copy();
    copy = new();
    copy.a = a;
    copy.b = b;
    copy.c = c;
    copy.d1 = d1.copy(); // Deep copy and will create a new object with the same data value
    // copy.d1 = d1; // Shallow copy and will reference the same object
    return copy;
  endfunction
  
  
endclass
 
 
module top_tb;
  
  second f1;
  second f2;

  initial begin
    f1 = new( .a(2), .b(4), .c(56)); //follow name
    f1.d1.d = 8'd7;
    f2 = f1.copy();
    f1.d1.d = 8'd8;
    $display("Data1 : %0d, Data2 : %0d and Data3 : %0d, and Data4: %0d", f2.a, f2.b, f2.c, f2.d1.d); 
  end
  
  
endmodule