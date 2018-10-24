source 'https://rubygems.org'

gem "bundler", "> 1"
if defined?(RUBY_VERSION) && RUBY_VERSION > '1.9'
  gem "rake", "~> 11.1"
else
  gem "rake", "< 11.0"
end

gem 'stretchysearch-api',        :path => File.expand_path("../stretchysearch-api", __FILE__),        :require => false
gem 'stretchysearch-transport',  :path => File.expand_path("../stretchysearch-transport", __FILE__),  :require => false
gem 'stretchysearch-extensions', :path => File.expand_path("../stretchysearch-extensions", __FILE__), :require => false
gem 'stretchysearch',            :path => File.expand_path("../stretchysearch", __FILE__),            :require => false

gem "pry"
gem "ansi"
gem "shoulda-context"
gem "mocha"
gem "turn"
gem "yard"

if defined?(RUBY_VERSION) && RUBY_VERSION > '1.9'
  gem "ruby-prof"    unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  gem "require-prof" unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  gem "simplecov"
  gem "simplecov-rcov"
  gem "cane"
end

if defined?(RUBY_VERSION) && RUBY_VERSION > '2.2'
  gem "test-unit", '~> 2'
end
