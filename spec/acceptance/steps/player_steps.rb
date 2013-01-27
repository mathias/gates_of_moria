step 'I am not playing' do 
end

step 'I start a new quiz' do 
  @game = Greenletters::Process.new('bin/gates_of_moria')
  @game.start!
end

step 'I quit' do
  @game << prepare_input("exit")
end

step 'the game should end' do
  @game.kill!
end

step 'I should see the Gates of Moria' do
  expected_pattern = massage_pattern("DOORS OF DURIN")
  @game.wait_for(:output, expected_pattern)
end

step 'I should be prompted for the answer to the first question' do
  expected_pattern = massage_pattern "Are you ready to begin your adventure"
  @game.wait_for(:output, expected_pattern)
end

step 'I should be prompted for the answer to the second question' do
  expected_pattern = massage_pattern "Now give me the name Gandalf as a String"
  @game.wait_for(:output, expected_pattern)
end

step 'I answer the first question correctly' do
  step 'I should be prompted for the answer to the first question'
  @game << prepare_input("true")
end

step 'I answer the first question incorrectly' do
  step 'I should be prompted for the answer to the first question'
  @game << prepare_input("moo")
end

step "I should see the first help text" do
  expected_pattern = massage_pattern('In Ruby, we say things are')
  @game.wait_for(:output, expected_pattern)
end

step "I should not see the first help text" do
  pattern = massage_pattern('In Ruby, we say things are')
  @game.check_until(pattern).should be_nil
end
