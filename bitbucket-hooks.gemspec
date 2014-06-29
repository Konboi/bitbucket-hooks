# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitbucket/hooks/version'

Gem::Specification.new do |spec|
  spec.name          = "bitbucket-hooks"
  spec.version       = Bitbucket::Hooks::VERSION
  spec.authors       = ["Konboi"]
  spec.email         = ["ryosuke.yabuki@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.homepage      = "https://github.com/Konboi/bitbucket-hooks"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rack"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rerun"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "2.14.1"
  spec.add_development_dependency "rack-test"
end
