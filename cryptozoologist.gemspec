# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cryptozoologist/version'

Gem::Specification.new do |spec|
  spec.name = "cryptozoologist"
  spec.version = Cryptozoologist::VERSION
  spec.authors = ["Liz Abinante"]
  spec.email = ["me@liz.codes"]

  spec.summary = "Generates random strings from animal, clothing item, and color pairings."
  spec.description = "Cryptozoologist generates random strings from animal, clothing item, and color pairings. It's fun and silly, because who doesn't want an orange sloth turtleneck?"
  spec.homepage = "https://github.com/feministy/cryptozoologist"
  spec.license = "MIT"

  spec.files = Dir["CODE_OF_CONDUCT.md", "CHANGELOG.md", "LICENSE.txt", "README.md", "lib/**/*.rb"]
  spec.test_files = Dir["spec/**/*.rb"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.3.0'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "pry", "~> 0.10.3"
  spec.add_development_dependency "pry-nav", "~> 0.2.4"
end
