require 'rubygems'
require 'gates_of_moria'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
Dir.glob("spec/acceptance/steps/**/*steps.rb") { |f| load f, true }
