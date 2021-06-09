`timescale 1ns / 100ps

module doorbell(
    //Todo: define inputs and outputs here
    input a,
    input b, 
    input sel, 
    output out
    );
    
    //Todo: define registers and wires here
    wire out;

    //Todo: define your logic here   

    // Logic for the output of the multiplexer  
    assign #5 out = (sel==0)?a:b;             
      
endmodule
