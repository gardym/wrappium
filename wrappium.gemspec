# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wrappium/version'

Gem::Specification.new do |spec|
  spec.name          = "wrappium"
  spec.version       = Wrappium::VERSION
  spec.authors       = ["Mike Gardiner"]
  spec.email         = ["mike@gardym.io"]
  spec.summary       = %q{Wrap Appium to provide an easy to manage client/server for test harnesses}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"

  spec.add_dependency "appium_lib", "~> 3.0.0"
end
