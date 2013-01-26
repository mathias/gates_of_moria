step 'I am not playing' do 
end

step 'I start a new quiz' do 
  @game = Greenletters::Process.new('bin/gates_of_moria')
  @game.start!
end

step 'I should see the Gates of Moria' do
  #@output.string.should include(@motd)
end

step 'I should be prompted for the answer to the first question' do
  expected_pattern = /Let me know your name by assigning it/
  @game.wait_for(:output, expected_pattern)
end

step 'I should be prompted for the answer to the second question' do
  expected_pattern = /Now send the string 'sevraq' to the translate method/
  @game.wait_for(:output, expected_pattern)
end

step 'I answer the first question correctly' do
  step 'I should be prompted for the answer to the first question'
  @game << "@name = 'Matt'\n"
end

step 'I answer the first question incorrectly' do
  step 'I should be prompted for the answer to the first question'
  @game << "moo = 'baz'\n"
end

step "I should see the first help text" do
  expected_pattern = /Variables hold information/
  @game.wait_for(:output, expected_pattern)
end

step "I should not see the first help text" do
  pattern = /Variables hold information/
  @game.check_until(pattern).should be_nil
end

step "I should see that I was correct" do
  pattern = Regexp.new("Correct! Next up...")
  @game.wait_for(:output, pattern)
end
