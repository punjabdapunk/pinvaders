# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pinvaders/version'

Gem::Specification.new do |s|
  s.name          = 'pinvaders'
  s.version       = Pinvaders::VERSION
  s.authors       = ['Shazad Rehman']
  s.email         = ['punjabdapunk@gmail.com']
  s.description   = %q{Psychedelic Invaders}
  s.summary       = %q{A colorful ASCII version of the ol' classic space invaders using ncurses}
  s.homepage      = ""

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  # s.add_runtime_dependency 'blah', [''>= 1.1.0', '< 2.0']
  # s.add_development_dependency 'blah', ['= 1.1.0']
end
