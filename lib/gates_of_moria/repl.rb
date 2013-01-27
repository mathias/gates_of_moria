module GatesOfMoria
  class REPL
    def initialize(output_buffer, input_buffer, questions)
      @output_buffer = output_buffer
      @input_buffer = input_buffer

      @questions = JSON.parse(questions)['questions']
      @last_question = @questions.pop
    end

    def start
      ask_the_questions
      ask_last_question
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
      @output_buffer.puts "\n=> #{result}\n\n"
      eval(expected_answer)
    end

    private

    def ask_last_question
      return prompt_with_help_texts @last_question
    end

    def ask_the_questions
      @questions.each do |question|
        if prompt_with_help_texts question
          next
        end
      end
      return false
    end

    def prompt_with_help_texts question
      eval(question['setup_code']) if question.has_key?('setup_code')
      @output_buffer.puts(question['title']) if question.has_key?('title')
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

    def display_leaving_game
      @output_buffer.puts("\nYou are leaving the game. Play again soon!\n")
    end
  end
end
