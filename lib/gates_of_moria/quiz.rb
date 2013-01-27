module GatesOfMoria
  class Quiz
    attr_accessor :motd

    def initialize(output_buffer, input_buffer, motd = nil)
      @output_buffer = output_buffer
      @input_buffer = input_buffer
      @motd = motd || File.read(File.expand_path("../data/motd.txt", __FILE__))
      @questions = File.read(File.expand_path("../data/questions.json", __FILE__))
    end

    def start
      @output_buffer.puts @motd

      @repl = GatesOfMoria::REPL.new(@output_buffer, @input_buffer, @questions)

      player_won = @repl.start

      if player_won
        @output_buffer.puts "Congratulations! You've opened the door to the mines.\n\nGood luck on your future adventures.\n\nMight I suggest trying RubyWarrior next?\n"
      else
        @output_buffer.puts "\n\nYour adventures with Ruby are not over yet!\n\nMay I suggest trying the game again, or going to read up on how Ruby works at:\n\n  http://www.ruby-lang.org/en/documentation/quickstart/\n"
      end
    end

  end
end
