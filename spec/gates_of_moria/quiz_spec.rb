require 'spec_helper'

module GatesOfMoria
  describe Quiz do
    context 'starting up' do
      it 'should send a welcome message' do
        messenger = mock('messenger').as_null_object
        messenger.should_receive(:puts).with('gates')
        game = GatesOfMoria::Quiz.new(messenger, 'gates')
        game.start
      end

      it 'should prompt for input' do
        messenger = mock('messenger').as_null_object
        messenger.should_receive(:puts).with("Let me know your name by assigning it to a variable called 'name'!")
        game = GatesOfMoria::Quiz.new(messenger, 'gates')
        game.start
      end
    end
  end
end
