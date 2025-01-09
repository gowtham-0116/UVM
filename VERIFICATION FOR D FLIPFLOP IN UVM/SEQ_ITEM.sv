class dff_seq_item extends uvm_sequence_item ;
  `uvm_object_utils(dff_seq_item)
  rand logic reset;
  rand logic d;
  logic q;
  
  function new(string name ="dff_seq_item");
    super.new(name);
    `uvm_info("seq_item class", "constructor", UVM_MEDIUM)
  endfunction
  
  constraint wr_rd_c {reset != 1;};
endclass
