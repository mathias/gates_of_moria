module GatesOfMoria
  class Quiz
    attr_accessor :motd

    def initialize(output_buffer, input_buffer, motd = nil)
      @output_buffer = output_buffer
      @input_buffer = input_buffer
      @motd = motd || File.read('lib/gates_of_moria/motd.txt')
      @questions = File.read('lib/gates_of_moria/questions.json')
    end

    def start
      @output_buffer.puts @motd
      @repl = GatesOfMoria::REPL.new(@output_buffer, @input_buffer, @questions)

      @repl.start
    end

  end
end
