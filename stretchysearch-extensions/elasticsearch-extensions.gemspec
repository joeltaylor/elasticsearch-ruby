# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stretchysearch/extensions/version'

Gem::Specification.new do |s|
  s.name          = "stretchysearch-extensions"
  s.version       = Stretchysearch::Extensions::VERSION
  s.authors       = ["Karel Minarik"]
  s.email         = ["karel.minarik@stretchysearch.org"]
  s.description   = %q{Extensions for the Stretchysearch Rubygem}
  s.summary       = %q{Extensions for the Stretchysearch Rubygem}
  s.homepage      = "https://github.com/stretchysearch/stretchysearch-ruby/tree/master/stretchysearch-extensions"
  s.license       = "Apache 2"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "ansi"
  s.add_dependency "stretchysearch"
  s.add_dependency "oj"
  s.add_dependency "patron"

  if defined?(RUBY_VERSION) && RUBY_VERSION > '1.9'
    s.add_dependency "ruby-prof" unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  end

  s.add_development_dependency "bundler", "> 1"

  if defined?(RUBY_VERSION) && RUBY_VERSION > '1.9'
    s.add_development_dependency "rake", "~> 11.1"
  else
    s.add_development_dependency "rake", "< 11.0"
  end

  s.add_development_dependency "awesome_print"

  s.add_development_dependency 'shoulda-context'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'minitest', '~> 5'
  s.add_development_dependency 'minitest-reporters', '~> 1'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'cane'
  s.add_development_dependency 'pry'

  if defined?(RUBY_VERSION) && RUBY_VERSION < '1.9'
    s.add_development_dependency "json", '~> 1.8'
  end
end
