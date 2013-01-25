module GatesOfMoria
  class REPL
    def initialize(questions)
      @questions = JSON.parse(questions)
    end
  end
end
