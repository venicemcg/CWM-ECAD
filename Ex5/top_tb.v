//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Venice McGauley
// Date: 
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps 

module top_tb();
  
// Define any parameters
  parameter CLK_PERIOD = 10; 
  parameter cooling = 2'b01; 
  parameter heating = 2'b10; 
  parameter ideal = 2'b00; 
  
// Define any registers and wires 
reg clk; 
  reg [4:0] temp; 
  wire heating; 
  wire cooling; 
  wire [1:0] current_temp = {heating, cooling};
  
  // Clock generation 
  initial begin 
    clk = 1'b0; 
    forever
      #(CLK_PERIOD/2) clk=~clk; 
  end
  
  //start at temp 0
  temp = 5'b00000; 
  forever begin 
    #10 if ((heat == 1 && temp > 20) || (cool == 1  && temp < 20) || (heat == 1 && cool == 1))
		begin err=1;
		end
		else
		begin err=0;
		end
end

//Trial response to high initial temp:

temp = 5'b11111;	
forever begin
	#10 if ((heat == 1 && temp > 20) || (cool == 1 && temp < 20) || (heat == 1 && cool == 1)) //confirming no illegal states in subsequenct clock cycles
		begin err=1;
		end
		else
		begin err=0;
		end

	end
end

//repeating but start at mid temp (20)


//Todo: Finish test, check for success
initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
	if (err==1)
	  $display("***TEST FAILED! :( ***");
        $finish;
      end

//Instantiating ac top:
ac top(clk,temp,heat,cool);

endmodule
