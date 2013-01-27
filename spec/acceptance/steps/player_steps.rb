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

step "I answer all the questions correctly" do
  step "I answer all questions up to the last one"

  # Part 6:
  @game << prepare_input("Door.tell('sevraq')")
  @game.wait_for(:output, massage_pattern('The door opens'))
end

step "I should see that I've won the game" do
  @game.wait_for(:output, massage_pattern('Congratulations'))
end

step "I answer all questions up to the last one" do
  step "I answer the first question correctly"
  # Part 1:
  @game << prepare_input('"Gandalf"')
  @game.wait_for(:output, massage_pattern('Part 2'))

  # Part 2:
  @game << prepare_input("@name = 'Matt'")
  @game.wait_for(:output, massage_pattern('Part 3'))

  # Part 3:
  @game << prepare_input("translate('sevraq')")
  @game.wait_for(:output, massage_pattern('Part 4'))

  # Part 4:
  @game << prepare_input("Door.read")
  @game.wait_for(:output, massage_pattern('Part 5'))

  # Part 5:
  @game << prepare_input("translate(Door.read)")
  @game.wait_for(:output, massage_pattern('speak friend and enter'))
  @game.wait_for(:output, massage_pattern('Part 6'))
end

step "I answer the last question incorrectly" do
  # Part 6:
  @game.wait_for(:output, massage_pattern('try sending the Door the message'))
  @game << prepare_input("Door.tell('moo')")
  @game.wait_for(:output, massage_pattern("=> The door remains firmly shut."))
end

step "I should see encouraging text to keep trying" do
  @game.wait_for(:output, massage_pattern('Your adventures with Ruby are not over yet'))
end
