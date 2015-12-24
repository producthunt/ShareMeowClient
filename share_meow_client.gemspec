# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'share_meow_client/version'

Gem::Specification.new do |spec|
  spec.name          = "share_meow_client"
  spec.version       = ShareMeowClient::VERSION
  spec.authors       = ["Mike Coutermarsh"]
  spec.email         = ["coutermarsh.mike@gmail.com"]

  spec.summary       = %q{Ruby client for generating ShareMeow URLs.}
  spec.description   = %q{Ruby client for generating ShareMeow URLs (https://github.com/producthunt/ShareMeow) }
  spec.homepage      = "https://github.com/producthunt/ShareMeowClient"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
