require 'spec_helper'

module GatesOfMoria
  describe REPL do
    describe 'answering questions' do
      context 'given correct answer' do
        let(:questions) { File.read('spec/fixtures/one_question.json') }
      
        it 'should return correct status' do
          GatesOfMoria::REPL.new(questions)
          
          user_answer = "@a = 5"
          expect { GatesOfMoria::REPL }.to be_true
        end
      end

      context 'given wrong answer' do
        it 'should return wrong status' do
        end
      end
    end
  end
end
