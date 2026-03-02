module reg64_tb();

reg [64-1:0] data_in;
reg clk;  // default=0
reg en;
wire [64-1:0] data_out;

// Instantiate DUT

reg64 dut(.data_out(data_out),.data_in(data_in),.en(en),.clk(clk)); 

// Clock generation
initial begin
  clk = 0;	// clocks must be initiated
  forever #5 clk = ~clk;    // Toggle clock every 5 time units
end

// Initial values
initial begin
  en = 1;
  data_in = 64'd9; 
  #10; 
  data_in = 64'd1; 
  #10;
  data_in = 64'd2; 
  #10; 
  data_in = 64'd3;
  #10; 
  data_in = 64'd4; 
  #10;
  data_in = 64'd5; 
  #10; 
  en = 0;
  data_in = 64'd6; 
  #10; 
  data_in = 64'd7; 
  en = 1;
  #10; 


end
  
endmodule