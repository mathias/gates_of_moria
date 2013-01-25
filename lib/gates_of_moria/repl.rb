module GatesOfMoria
  class REPL
    def initialize(output_buffer, input_buffer, questions)
      @output_buffer = output_buffer
      @input_buffer = input_buffer

      @questions = JSON.parse(questions)['questions']
    end

    def start
      @questions.each do |q|
        @output_buffer.puts q['initial_prompt']
        @input_buffer.gets
      end
    end

    def answer_question(expected_answer, user_input)
      begin
        result = eval(user_input)
      rescue SyntaxError
        politely_say_their_ruby_is_invalid
        return false
      end

      eval(expected_answer)
    end

    private

    def politely_say_their_ruby_is_invalid
      @output_buffer.puts("That doesn't look like Ruby to me. Please try again!")
    end
  end
end
