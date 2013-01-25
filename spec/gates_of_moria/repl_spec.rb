require 'spec_helper'

module GatesOfMoria
  describe REPL do
    describe '#answer_question' do
      let(:questions) { File.read('spec/fixtures/one_question.json') }
      let(:output) {  mock('output').as_null_object }
      let(:input) {  mock('input').as_null_object }
      let(:expected_answer) { '@a == 5' }

      context 'given correct answer' do

        it 'should be true (correct)' do
          repl = GatesOfMoria::REPL.new(output, input, questions)
          user_input = "@a = 5"
          repl.answer_question(expected_answer, user_input).should be_true
        end
      end

      context 'given wrong answer' do
        it 'should be false (incorrect)' do
          repl = GatesOfMoria::REPL.new(output, input, questions)
          user_input = "@a = 1"
          repl.answer_question(expected_answer, user_input).should be_false
        end
      end

      context 'given invalid ruby' do
        ["foo", "foo = ", "lambda { ", ")"].each do |user_input|
          it 'should be false (incorrect)' do
            repl = GatesOfMoria::REPL.new(output, input, questions)
            repl.answer_question(expected_answer, user_input).should be_false
          end
        end
      end
    end
  end
end
