module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

// Connect by position

  mod_a mod_a_i1 (out1, out2, a, b, c, d);

endmodule
