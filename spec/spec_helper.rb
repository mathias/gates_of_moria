require 'rubygems'
require 'gates_of_moria'

Dir.glob("spec/support/*.rb") { |f| load f, true }
Dir.glob("spec/acceptance/steps/**/*steps.rb") { |f| load f, true }
