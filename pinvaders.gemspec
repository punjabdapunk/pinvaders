# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pinvaders/version'

Gem::Specification.new do |gem|
  gem.name          = "pinvaders"
  gem.version       = Pinvaders::VERSION
  gem.authors       = ["Shazad Rehman"]
  gem.email         = ["punjabdapunk@gmail.com"]
  gem.description   = %q{Psychedelic Invaders}
  gem.summary       = %q{A colorful ASCII version of the ol' classic Space Invaders}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
