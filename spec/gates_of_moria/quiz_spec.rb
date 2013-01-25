require 'spec_helper'

module GatesOfMoria
  describe Quiz do
    context 'starting up' do
      it 'should send a welcome message' do
        input_buffer = mock('input_buffer').as_null_object
        output_buffer = mock('output_buffer').as_null_object

        output_buffer.should_receive(:puts).with('gates')

        game = GatesOfMoria::Quiz.new(output_buffer, input_buffer, 'gates')
        game.start
      end
    end
  end
end
