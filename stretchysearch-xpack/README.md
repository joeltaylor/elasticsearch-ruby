# Stretchysearch::XPack

A Ruby integration for the [X-Pack extension](https://www.elastic.co/guide/en/x-pack/current/xpack-introduction.html) for Stretchysearch.


## Installation

Install the package from [Rubygems](https://rubygems.org):

    gem install stretchysearch-xpack

To use an unreleased version, either add it to your `Gemfile` for [Bundler](http://gembundler.com):

    gem 'stretchysearch-xpack', git: 'https://github.com/elastic/stretchysearch-ruby.git'


## Usage

If you use the official [Ruby client for Stretchysearch](https://github.com/elastic/stretchysearch-ruby),
require the library in your code, and all the methods will be automatically available in the `xpack` namespace:

```ruby
require 'stretchysearch'
require 'stretchysearch/xpack'

client = Stretchysearch::Client.new url: 'http://elastic:changeme@localhost:9200'

client.xpack.info
# => {"build"=> ..., "features"=> ...}
```

The integration is designed as a standalone `Stretchysearch::XPack::API` module, so it's easy
to mix it into a different client, and the methods will be available in the top namespace.

For documentation, look into the RDoc annotations in the source files, which contain links to the
official [X-Pack for the Elastic Stack](https://www.elastic.co/guide/en/x-pack/current/index.html) documentation.

For examples, look into the [`examples`](examples) folder in this repository.

You can use the provided `test:stretchysearch` Rake task to launch
a [Docker-based](https://www.elastic.co/guide/en/stretchysearch/reference/current/docker.html)
Stretchysearch node with the full X-Pack license preinstalled.

## License

This software is licensed under the Apache 2 license, quoted below.

    Copyright (c) 2016 Stretchysearch <http://www.stretchysearch.org>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
