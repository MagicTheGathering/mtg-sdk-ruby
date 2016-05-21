# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mtg_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "mtg_sdk"
  spec.version       = MTG::VERSION
  spec.authors       = ["Andrew Backes"]
  spec.email         = ["backes.andrew@gmail.com"]
  spec.summary       = "Magic: The Gathering SDK for magicthegathering.io"
  spec.description   = "Magic: The Gathering SDK is a wrapper around the MTG API located at magicthegathering.io"
  spec.homepage      = "https://magicthegathering.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 11.1"
  spec.add_development_dependency "minitest", "~> 5.9"
  spec.add_development_dependency "vcr", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 2.0"
  spec.add_development_dependency "simplecov", "~> 0.11"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.5"

  spec.add_dependency "roar", "~> 1.0"
  spec.add_dependency "json", "~> 1.8"
  spec.add_dependency "multi_json", "~> 1.11"
  spec.add_dependency "multi_xml", "~> 0.5"
  spec.add_dependency "faraday_middleware", "~> 0.10"
  spec.add_dependency "virtus"
end
