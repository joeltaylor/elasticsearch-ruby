# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stretchysearch/dsl/version'

Gem::Specification.new do |s|
  s.name          = "stretchysearch-dsl"
  s.version       = Stretchysearch::DSL::VERSION
  s.authors       = ["Karel Minarik"]
  s.email         = ["karel.minarik@stretchysearch.com"]
  s.description   = %q{A Ruby DSL builder for Stretchysearch}
  s.summary       = s.description
  s.homepage      = "https://github.com/stretchysearch/stretchysearch-ruby/tree/master/stretchysearch-dsl"
  s.license       = "Apache 2"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.extra_rdoc_files  = [ "README.md", "LICENSE.txt" ]
  s.rdoc_options      = [ "--charset=UTF-8" ]

  s.required_ruby_version = '>= 1.9'

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake", "~> 11.1"

  s.add_development_dependency "stretchysearch"
  s.add_development_dependency "stretchysearch-extensions"

  s.add_development_dependency 'shoulda-context'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'minitest', '~> 5'
  s.add_development_dependency 'minitest-reporters', '~> 1'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'cane'
  s.add_development_dependency 'pry'

  if defined?(RUBY_VERSION) && RUBY_VERSION > '2.2'
    s.add_development_dependency "test-unit", '~> 2'
  end
end
