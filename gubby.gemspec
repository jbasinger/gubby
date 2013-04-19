# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gubby/version'

Gem::Specification.new do |spec|
  spec.name          = "gubby"
  spec.version       = Gubby::VERSION
  spec.authors       = ["Justin Basinger"]
  spec.email         = ["justin.m.basinger@gmail.com"]
  spec.description   = "This is a system used to create component based objects. Primarily for games, but you don't have to use it just for that if you don't want to."
  spec.summary       = "Gubby component system"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
	
end
