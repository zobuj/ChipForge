### Loops for Array Operations**
In SystemVerilog, we can create a `for` loop, `repeat`, or `foreach` to iterate through an array. Here is an example of each:

```systemverilog
// Example of a for loop
for (int i = 0; i < array.size(); i++) begin
    // Perform operations on array[i]
end

// Example of a repeat loop
int count = 10;
repeat (count) begin
    // Perform operations
end

// Example of a foreach loop
foreach (array[i]) begin
    // Perform operations on array[i]
end
```


### Copying Arrays
- **Shallow Copy**:, you can use the `=` operator to create a shallow copy of an array.
    - Example:
        ```systemverilog
        bit [7:0] originalArray [0:9];
        bit [7:0] newArray [0:9];
        newArray = originalArray; // Shallow copy
        ```
- **Deep Copy**: To perform a deep copy, you need to manually copy each element of the array.
    - Example:
        ```systemverilog
        bit [7:0] originalArray [0:9];
        bit [7:0] newArray [0:9];
        for (int i = 0; i < originalArray.size(); i++) begin
            newArray[i] = originalArray[i]; // Deep copy
        end
        ```
### Extending the Length of a Dynamic Array
- To extend the length of a dynamic array, you can use the `resize` method or manually allocate a new array with the desired size and copy the elements.
    - Example using `resize`:
        ```systemverilog
        bit [7:0] dynamicArray [];
        dynamicArray = new[10]; // Initial size
        dynamicArray = new[20](dynamicArray); // Extend to size 20
        ```

### Comparing Arrays
- **Equality Check**: To check if two arrays are equal, compare their lengths and corresponding elements.
    - Example:
        ```systemverilog
        function bit arraysEqual(bit [7:0] arr1 [0:9], bit [7:0] arr2 [0:9]);
            if (arr1.size() != arr2.size()) return 0;
            for (int i = 0; i < arr1.size(); i++) begin
                if (arr1[i] != arr2[i]) return 0;
            end
            return 1;
        endfunction
        ```
- **Deep Comparison**: For arrays containing objects or nested arrays, you need to recursively compare each element.
    - Example:
        ```systemverilog
        function bit deepCompare(bit [7:0] arr1 [0:9], bit [7:0] arr2 [0:9]);
            if (arr1.size() != arr2.size()) return 0;
            for (int i = 0; i < arr1.size(); i++) begin
                if (arr1[i] != arr2[i]) return 0;
            end
            return 1;
        endfunction
        ```

