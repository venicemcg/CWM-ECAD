//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name: Venice McGauley
// Date: 9th June 2021 
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps 

module top_tb(); 
  
  parameter CLK_PERIOD = 10; 
  
  // regs and wires
  reg sel; 
  reg clk; 
  wire [23:0] light;
  reg rst; 
  reg button; 
  reg err; 
  
  // clock generation 
  initial begin 
    clk = 1'b0; 
    forever 
      #(CLK_PERIOD/2) clk=~clk; 
  end
  
  initial begin 
    //checking white light for select = 0
    sel = 0; 
    rst = 0; 
    button = 1; 
    err = 0; 
    forever begin 
      #10 if (light != 24'hFFFFFF)
        begin 
          err <= 1; 
        end 
      else
        begin 
          err <= err; 
        end
    end
    
    // checking reset works
    sel = 1; 
    rst = 1; 
    forever begin 
      #10 if (light != 24'h000000)
        begin 
          err <= 1; 
        end
      else
        begin 
          err <= err; 
        end
    end
    
    // testing that lights do not reach black or white it button not held (and reset off and button off)
    rst = 0; 
    button = 0; 
    forever
      begin #10 if ((light == 24'h000000) || (light == 24'hFFFFFF))
        begin 
          err <= 1; 
        end
        else
          begin 
            err <= err; 
          end
      end
  end
  
  // finish test, check for success
  initial begin 
    #50 
    if (err == 0)
      $display("test passed"); 
    $finish; 
    if (err == 1)
      $display("test failed")
      $finish; 
  end
  
  // instantiating selector top
  selector top(clk, sel, rst, button, light); 
endmodule 
