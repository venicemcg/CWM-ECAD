//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name: Venice McGauley
// Date: 8th June 2021 
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
parameter CLK_PERIOD = 10;  
 
//Todo: Regitsers and wires
reg clk;
reg rst; 
reg change; 
reg on_off; 
reg err; 

wire [7:0] counter_out; 
    reg [7:0] local_counter; 

//Todo: Clock generation
initial 
begin 
   clk = 1'b0; 
   forever
      #(CLK_PERIOD/2) clk=~clk; 
   end 

//Todo: User logic
initial begin 
   //initialise all the register values 
   rst = 1; 
   on_off = 1; 
   change = 0; 
   err = 0;
   clk = 0; 
   local_counter = 0; 

    #10 if (counter_out != 0)
        begin err = 1;
        end
    rst = 0; // Now test for change = 0 
    #20 if (counter_out != 0) 
        begin err = 1; 
        end 
    // Testing for change = 1
    change = 1;
    forever
        begin 
            #(CLK_PERIOD*2)
            local_counter = on_off?local_counter+1:local_counter-1;
            if (local_counter!=counter_out)
                begin 
                    err = 1; 
                end 
        end
    // Finish test, check for success
    if (err==0) begin 
        $display("TEST PASSED"); 
        $finish; 
    end 
    if (err==1) begin 
        $display("TEST FAILED"); 
        $finish 
    end 
end 
    //Instantiate monitor module 
    monitor top(clk. rst, change, on_off, counter_out); 
endmodule 
