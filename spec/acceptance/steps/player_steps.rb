step 'I am not playing' do 
end

step 'I start a new quiz' do 
  # simulate a game playing input/output session:
  @output = StringIO.new
  @input = StringIO.new
  @motd = 'gates'

  @quiz = GatesOfMoria::Quiz.new(@output, @input, @motd)
  @quiz.start
end

step 'I should see the Gates of Moria' do
  @output.string.should include(@motd)
end

step 'I should be prompted for the answer to the first question' do
  @output.string.should include("Let me know your name by assigning it to a variable called '@name'!")
end

step 'I should be prompted for the answer to the second question' do
  @output.string.should include("Try translating a piece of strange text that is stored in @strange_text with the 'strange' method.")
end

step 'I answer the first question correctly' do
  step 'I should be prompted for the answer to the first question'
  @input.gets "name = 'Matt'"
end

step 'I answer the first question incorrectly' do
  step 'I should be prompted for the answer to the first question'
  @input.gets "moo = 'baz'"
end

step "I should see the first help text" do
  @output.string.should include("Variables hold information. We use the equal sign to assign information into a variable:\n@name = \"Matt\"")
end
