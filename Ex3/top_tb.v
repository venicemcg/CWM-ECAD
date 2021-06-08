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

reg [7:0] counter_out; 
reg [7:0] counter_out_prev; 

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

   forever begin 
   // First test to check that counter = 0 when rst = 1
      #(CLK_PERIOD)
      if ( (rst==1) && (counter_out==1) ) 
      begin
         $display("***TEST FAILED*** counter_out = 1 when rst = 1);
         err = 1; 
      end 
   // Next test that counter doesn't change when change = 0 and rst = 0 
   #(2*CLK_PERIOD)
   rst = 0; 
   counter_out_prev = counter_out; 
   #(CLK_PERIOD)
   if ( (change==0) && (counter_out_prev!=counter_out) ) 
   begin 
      $display("***TEST FAILED*** counter is counting when change = 0");
      err = 1; 
   end 

   // Next test to check counter counts up when change = 1 and on_off = 1
   #(2*CLK_PERIOD)
   change = 1; 
   #(2*CLK_PERIOD)
      counter_out_prev = counter_out; 
      #(CLK_PERIOD)
   if ( (on_off==1) && (counter_out!=counter_out_prev + 1) )
   begin 
      $display("***TEST FAILED*** counter failed to count up when on_off = 1"); 
      err = 1; 
   end 

   // Finally test to check counter counts down when change = 1 and on_off = 0 
   #(2*CLK_PERIOD)
   on_off = 0; 
   #(2*CLK_PERIOD) 
      counter_out_prev = counter_out; 
      #(CLK_PERIOD)
   if ( (on_off==0) && (counter_out!=counter_out_prev - 1) ) 
   begin 
      $display("***TEST FAILED*** counter failed to count down when on_off = 0"); 
      err = 1; 
   end 
   end 
end 
    
//Todo: Finish test, check for success
initial begin 
   #100 
   if (err==0)
      $display("***TEST PASSED***"); 
   $finish; 
end  
   

//Todo: Instantiate counter module
monitor top(
.clk(clk), 
.rst(rst), 
.change(change), 
.on_off(on_off), 
.counter_out(counter_out)
); 
endmodule 
