module GatesOfMoria
  class Quiz
    attr_accessor :motd

    def initialize(output_buffer, motd = nil)
      @output_buffer = output_buffer
      @motd = motd || File.read('lib/gates_of_moria/motd.txt')
    end

    def start
      @output_buffer.puts @motd
      step_one
    end

    private

    def step_one
      @output_buffer.puts "Let me know your name by assigning it to a variable called 'name'!"
    end
  end
end
