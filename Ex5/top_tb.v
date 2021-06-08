//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Venice McGauley
// Date: 8th June 2021 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps 

module top_tb();
  
// Define any parameters
  parameter CLK_PERIOD = 10; 
  
// Define any registers and wires 
  reg clk; 
  wire heat; 
  wire cool; 
  reg err; 
  reg [4:0] temp; 
  
// Clock generation 
  initial begin 
    clk = 1'b0; 
    forever
      #(CLK_PERIOD/2) clk=~clk; 
  end 
// start with temp = 0
  initial begin 
    temp = 5'b00000; 
    // heat = 0 cool = 0 
    forever begin 
      #10 if ((heat == 1 && temp > 20) || (cool == 1 && temp < 20) || (heat == 1 && cool == 1)) 
        begin err = 1; 
        end
      else
        begin err = 0; 
        end 
    end
    
    // trial a response to a high initial temperature
    temp = 5'b11111; 
    forever begin 
      #10 if ((heat == 1 && temp > 20) || (cool == 1 && temp < 20) || (heat == 1 && cool == 1))
        begin err = 1; 
        end
      else
        begin err = 0; 
        end
    end
  end
  
  // repeat a traial but starting with a middle temperature
  temp = 5'b00101 
  forever begin 
    #10 if ((heat == 1 && temp > 20) || (cool == 1 && temp < 20) || (heat == 1 && cool == 1)) 
      begin err = 1; 
      end 
    else
      begin err = 0; 
      end 
  end
  
  // Finish the test and check for success
  initial begin 
    #50 
    if (err == 0) 
      $display("***TEST PASSED***"); 
    $finish; 
    if (err == 1) 
      $display("***TEST FAILED***"); 
    $finish 
  end 
  
  // Instantiating ac top 
  ac top(
    .clk(clk), 
    .temp(temp), 
    .heat(heat), 
    .cool(cool)
  ); 
  
endmodule 
