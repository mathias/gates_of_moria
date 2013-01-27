RSpec.configure do |config|
  config.after(:each) do
    if @game && @game.alive?
      @game.kill!
    end
  end
end
