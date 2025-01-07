`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module top;
  logic clk;
  dff dut(
    .clk(intf.clk),
    .reset(intf.reset),
    .d(intf.d),
    .q(intf.q));
  
  dff_intf intf(.clk(clk));
  
  initial begin
    uvm_config_db#(virtual dff_intf)::set(null,"*","vif",intf);
  end
    
    
  
  initial begin
    clk = 0;
  end
  
  always #10 clk= ~clk;
  
  initial begin 
    $monitor($time,"clk =%0d",clk);
    #200 $finish;
  end
  initial begin
    $dumpfile("dff.vcd");
    $dumpvars;
  end
  
  initial begin
    run_test("dff_test");
  end
  
endmodule
    
    
