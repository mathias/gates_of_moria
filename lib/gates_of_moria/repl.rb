module GatesOfMoria
  class REPL
    def initialize(output_buffer, input_buffer, questions)
      @output_buffer = output_buffer
      @input_buffer = input_buffer

      @questions = JSON.parse(questions)['questions']
    end

    def start
      ask_the_questions
    end

    def answer_question(expected_answer, user_input)
      begin
        result = eval(user_input + ";" + expected_answer)
      rescue SyntaxError, Exception
        politely_say_their_ruby_is_invalid
        return false
      end
      result
    end

    private
    def win_the_game
      @output_buffer.puts "WINNER"
    end

    def lose_the_game
      @output_buffer.puts "LOSER"
    end

    def ask_the_questions
      @questions.each do |question|
        return false unless prompt_with_help_texts question
      end
    end

    def prompt_with_help_texts question
      question['help_texts'].each do |ht|
        prompt_question ht

        next if answer_question(question['expected_response'], get_user_input)
        politely_say_they_are_wrong
      end
    end

    def prompt_question prompt
      @output_buffer.puts
      @output_buffer.puts prompt
      @output_buffer.print '> '
    end

    def get_user_input
      (@input_buffer.gets || '').chomp
    end

    def politely_say_their_ruby_is_invalid
      @output_buffer.puts("That doesn't look like Ruby to me.")
    end

    def politely_say_they_are_wrong
      @output_buffer.puts("Sorry, that's not it.")
    end
  end
end
