# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gates_of_moria/version'

Gem::Specification.new do |gem|
  gem.name          = "gates_of_moria"
  gem.version       = GatesOfMoria::VERSION
  gem.authors       = ["Matt Gauger", "Jaymes Waters"]
  gem.email         = ["matt@bendyworks.com"]
  gem.description   = %q{A simple quiz to test Ruby knowledge}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/mathias/gates_of_moria"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency('rspec', '~> 2.11.0')
  gem.add_development_dependency('turnip')
  gem.add_development_dependency('pry')

end
