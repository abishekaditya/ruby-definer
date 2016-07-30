# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'definer/version'

Gem::Specification.new do |spec|
  spec.name          = "definer"
  spec.version       = Definer::VERSION
  spec.authors       = ["Abishek Aditya"]
  spec.email         = ["abishekaditya@outlook.com"]

  spec.summary       = "gem that defines words"
  spec.description   = "definer is a gem that is used to define simple words using the define command. CLI options for example (-e) and part of speech (-p) are also present"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["define"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
