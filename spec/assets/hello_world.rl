# simple_state_machine.rl
%%{
  machine hello;
  expr = "h";
  main := expr @ { puts "hello world!" } ;
}%%

  %% write data;

def run_machine(data)
  puts "Running the state machine with input #{data}..."
  
  %% write init;
  %% write exec;
  
  puts "Finished. The state of the machine is: #{cs}"
  puts "p: #{p} pe: #{pe}"
end

run_machine "h"
run_machine "x"
run_machine "hh"
