class dff_sequence extends uvm_sequence;
  `uvm_object_utils(dff_sequence)
  dff_seq_item tx;
  
  
  function new(string name ="dff_env");
    super.new(name);
    `uvm_info("sequence class", "constructor", UVM_MEDIUM)
  endfunction
  
    task body();
    repeat(5) begin
      
    tx = dff_seq_item ::type_id::create("tx");
      `uvm_do(tx);
      /*wait_for_grant();
      tx.randomize();// with (rst==1);
      send_request(tx);
      wait_for_item_done();*/
    end
    endtask
endclass
