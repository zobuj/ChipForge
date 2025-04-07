class generator;
  
  bit [3:0] a = 5,b =7;
  bit wr = 1;
  bit en = 1;
  bit [4:0] s = 12;
  
  function void display();
    $display("a:%0d b:%0d wr:%0b en:%0b s:%0d", a,b,wr,en,s);
  endfunction
 
    function generator copy();
        copy = new();
        copy.a = a;
        copy.b = b;
        copy.wr = wr;
        copy.en = en;
        copy.s = s;
    endfunction

endclass

class wrapper;
    generator g;

    function new();
        this.g = new();
    endfunction

    function wrapper copy();
        copy = new();
        copy.g = g.copy();
    endfunction

endclass

module gen_deep;

    wrapper w1;
    wrapper w2;


    initial begin
        w1 = new();
        w2 = w1.copy();
        w2.g.display();
        w1.g.a = 1;
        w2.g.display();
        w2.g.a = 2;
        w1.g.display();
        w2.g.display();

        $finish;

    end

endmodule