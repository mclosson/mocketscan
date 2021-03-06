# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mocketscan/version'

Gem::Specification.new do |spec|
  spec.name          = "mocketscan"
  spec.version       = Mocketscan::VERSION
  spec.authors       = ["Matthew Closson"]
  spec.email         = ["matthew.closson@gmail.com"]
  spec.description   = %q{Example port scanner project using the mockets socket mocking library}
  spec.summary       = %q{Port scanner which uses mockets}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "mockets"
end
