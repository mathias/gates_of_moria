step 'I am not playing' do 
end

step 'I start a new quiz' do 
  # simulate a game playing input/output session:
  @messenger = StringIO.new
  @motd = 'gates'
  @quiz = GatesOfMoria::Quiz.new(@messenger, @motd)
  @quiz.start
end

step 'I should see the Gates of Moria' do
  @messenger.string.should include(@motd)
end

step 'I should be prompted for input' do
  @messenger.string.should include("Let me know your name by assigning it to a variable called 'name'!")
end

