# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cryptozoologist/version'

Gem::Specification.new do |spec|
  spec.name          = "cryptozoologist"
  spec.version       = Cryptozoologist::VERSION
  spec.authors       = ["Liz Abinante"]
  spec.email         = ["me@liz.codes"]

  spec.summary       = "Generates random strings from animal, clothing item, and color pairings."
  spec.description   = "Cryptozoologist generates random strings from animal, clothing item, and color pairings. You could get something like 'orange-clownfish-turtleneck' or 'magenta-three-toed-sloth-shoe-horn'. It's fun and silly - it's also very simple, which is why it is used as an example for the Gem guide project."
  spec.homepage      = "https://github.com/feministy/cryptozoologist"
  spec.license       = "MIT"

  spec.files         = Dir["CODE_OF_CONDUCT.md", "CHANGELOG.md", "LICENSE.txt", "README.md", "lib/**/*.rb"]
  spec.test_files    = Dir["spec/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10.3"
  spec.add_development_dependency "pry-nav", "~> 0.2.4"
end
