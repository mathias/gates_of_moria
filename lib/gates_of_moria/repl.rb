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
        result = eval(user_input)
      rescue SystemExit
        display_leaving_game
        exit 0
      rescue SyntaxError, Exception
        politely_say_their_ruby_is_invalid
        return false
      end
      @output_buffer.puts "\n=> #{result}\n"
      eval(expected_answer)
    end

    private
    def ask_the_questions
      @questions.each do |question|
        if prompt_with_help_texts question
          display_you_are_correct
          next
        end
      end
      return false
    end

    def prompt_with_help_texts question
      eval(question['setup_code']) if question.has_key?('setup_code')
      question['help_texts'].each do |ht|
        prompt_question ht

        return true if answer_question(question['expected_response'], get_user_input)
        politely_say_they_are_wrong
      end
      return false
    end

    def prompt_question prompt
      @output_buffer.print "\n#{prompt}\n> "
    end

    def get_user_input
      input = @input_buffer.gets
      (input || '').chomp
    end

    def politely_say_their_ruby_is_invalid
      @output_buffer.puts("That doesn't look like Ruby to me.")
    end

    def politely_say_they_are_wrong
      @output_buffer.puts("Sorry, that's not it.")
    end

    def display_you_are_correct
      @output_buffer.puts("Correct! Next up...")
    end

    def display_leaving_game
      @output_buffer.puts("\nYou are leaving the game. Play again soon!\n")
    end
  end
end
