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

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
