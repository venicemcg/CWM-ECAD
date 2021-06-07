//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 - Active IoT Devices Monitor
// Student Name: Venie McGauley
// Date: 7th June 2021 
//
//  Description: In this exercise, you need to design a counter of active IoT devices, where 
//  if the rst=1, the counter should be set to zero. If change=0, the value
//  should stay constant. If on-off=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, change, on_off
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module monitor (
    //Todo: add ports
    // Initialise the inputs
    // Should event be an input 
    input rst,
    input clk, 
    input change, 
    input on_off,
    output [7:0] counter_out 
    );
                    
    //Todo: add registers and wires, if needed 
    // We are using a register and not a wire since we want counter_out to store values 
    reg counter_out; 

    //Todo: add user logic
    always @(posedge clk) 
    begin 
    if (rst==1) 
       counter_out = 0; 
    else if (change == 0) 
       counter_out = counter_out; 
    else if (on_off == 1) 
       counter_out = counter_out + 1;  
    else if (on_off == 0)
       counter_out = counter_out - 1; 
    end      
endmodule
