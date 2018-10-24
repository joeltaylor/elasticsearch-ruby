# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stretchysearch/xpack/version'

Gem::Specification.new do |spec|
  spec.name          = "stretchysearch-xpack"
  spec.version       = Stretchysearch::XPack::VERSION
  spec.authors       = ["Karel Minarik"]
  spec.email         = ["karel@elastic.co"]

  spec.summary       = "Ruby integrations for the X-Pack extensions for Stretchysearch"
  spec.description   = "Ruby integrations for the X-Pack extensions for Stretchysearch"
  spec.homepage      = "https://github.com/elastic/stretchysearch-xpack-ruby"
  spec.license       = "Apache 2"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 11.1"

  spec.add_dependency "stretchysearch-api", '~> 6'

  spec.add_development_dependency "stretchysearch", '~> 6'
  spec.add_development_dependency "stretchysearch-transport", '~> 6'
  spec.add_development_dependency "stretchysearch-extensions"

  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "ansi"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "shoulda-context"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "pry"
end
