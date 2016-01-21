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

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "json"
  spec.add_dependency "roar"
  spec.add_dependency "virtus"
end
