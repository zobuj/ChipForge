// class fir; // parent

//     int data = 12;

//     virtual function void display();
//         $display("Value of data : %0d", data);


//     endfunction




// endclass



// class sec extends fir; // child

//     int temp = 34;
//     function void add();
    
//      $display("Value after processing: %0d", temp+4);
//     endfunction

//     virtual function void display();
//         $display("This is the child class!");
//         // super.display();

//     endfunction

// endclass

// module inheritance;


//     sec s;
//     initial begin
//         s = new();
//         // $display("Value of data : %0d", s.data);
//         s.display();
//         // $display("Value of temp : %0d", s.temp);
//         // s.add();



//     end

// endmodule
class Base;
    virtual function void display();
        $display("Base class display function");
    endfunction
endclass

class Derived extends Base;
    function void display(); // 'virtual' here is optional
        $display("Derived class display function");
    endfunction
endclass

module testbench;
    Base base_obj;
    Derived derived_obj;

    initial begin
        derived_obj = new();
        base_obj = derived_obj; // Assign derived object to base class handle

        base_obj.display(); // Calls Derived::display() due to polymorphism
    end
endmodule
