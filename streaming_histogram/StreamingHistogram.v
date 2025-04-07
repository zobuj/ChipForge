// This module counts occurrences of word values
// over valid words carried by the streaming interface,
// and presents the counts on the querying interface.

module StreamingHistogram
#(
    // log2 of the number of data words in a single streaming cycle
    parameter log2_words    = 3,
    // width of each data word in bits
    parameter word_width    = 12,
    // width of the data word frequency counter in bits
    parameter count_width   = 48,

    // derived data width
    // word 0 is contained in bits [word_width - 1 : 0]
    // word 1 is contained in bits [2 * word_width - 1 : word_width]
    // ...
    // word K is contained in bits [(K + 1) * word_width - 1 : K * word_width],
    //  0 <= K < 2 ** log2_words
    parameter data_width    = word_width * 2 ** log2_words
)
(
    // rising edge 200 MHz clock
    input  wire                     clk,
    // synchronous active-high reset
    input  wire                     rst,

    // streaming interface
    input  wire                     stream_valid,
    input  wire [data_width-1:0]    stream_data,

    // counter querying interface
    input  wire                     query_valid,
    input  wire [word_width-1:0]    query_word,
    output wire [count_width-1:0]   query_count
);

    // your implementation here ...

    




endmodule
