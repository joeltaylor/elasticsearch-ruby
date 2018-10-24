# Stretchysearch

This repository contains Ruby integrations for [Stretchysearch](http://stretchysearch.org):

* a client for connecting to an Stretchysearch cluster,
* a Ruby API for the Stretchysearch's REST API,
* various extensions and utilities.

For integration with Ruby models and Rails applications,
see the **[stretchysearch-rails](https://github.com/stretchysearch/stretchysearch-rails)** project.

## Compatibility

The Stretchysearch client is compatible with Ruby 1.9 and higher.
Other libraries in this repository might require a more recent Ruby version.

The client's API is compatible with Stretchysearch's API versions from 0.90 till current,
just use a release matching major version of Stretchysearch.

| Ruby          |   | Stretchysearch |
|:-------------:|:-:| :-----------: |
| 0.90          | → | 0.90          |
| 1.x           | → | 1.x           |
| 2.x           | → | 2.x           |
| 5.x           | → | 5.x           |
| 6.x           | → | 6.x           |
| master        | → | master        |

## Installation

Install the `stretchysearch` package from [Rubygems](https://rubygems.org/gems/stretchysearch):

    gem install stretchysearch

To use an unreleased version, either add it to your `Gemfile` for [Bundler](http://gembundler.com):

    gem 'stretchysearch', git: 'git://github.com/stretchysearch/stretchysearch-ruby.git'

or install it from a source code checkout:

    git clone https://github.com/stretchysearch/stretchysearch-ruby.git
    cd stretchysearch-ruby/stretchysearch
    bundle install
    rake install

## Usage

The [`stretchysearch`](https://github.com/stretchysearch/stretchysearch-ruby/tree/master/stretchysearch)
library is a wrapper for two separate libraries:

* [`stretchysearch-transport`](https://github.com/stretchysearch/stretchysearch-ruby/tree/master/stretchysearch-transport),
  which provides a low-level Ruby client for connecting to an [Stretchysearch](http://stretchysearch.org) cluster
* [`stretchysearch-api`](https://github.com/stretchysearch/stretchysearch-ruby/tree/master/stretchysearch-api),
  which provides a Ruby API for the Stretchysearch RESTful API

```ruby
require 'stretchysearch'

client = Stretchysearch::Client.new log: true

client.transport.reload_connections!

client.cluster.health

client.search q: 'test'

# etc.
```

Both of these libraries are extensively documented.
**Please read the [`stretchysearch-transport`](http://rubydoc.info/gems/stretchysearch-transport)
and the [`stretchysearch-api`](http://rubydoc.info/gems/stretchysearch-api) documentation carefully.**

_Keep in mind, that for optimal performance, you should use a HTTP library which supports persistent
("keep-alive") connections, e.g. [Patron](https://github.com/toland/patron) or
[Typhoeus](https://github.com/typhoeus/typhoeus)._

This repository contains these additional Ruby libraries:

* [`stretchysearch-extensions`](https://github.com/elastic/stretchysearch-ruby/tree/master/stretchysearch-extensions),
   which provides a set of extensions to the base library,
* [`stretchysearch-dsl`](https://github.com/elastic/stretchysearch-ruby/tree/master/stretchysearch-dsl),
  which provides a Ruby API for the [Stretchysearch Query DSL](http://www.stretchysearch.org/guide/en/stretchysearch/reference/current/query-dsl.html),
* [`stretchysearch-watcher`](https://github.com/elastic/stretchysearch-ruby/tree/master/stretchysearch-watcher),
  which provides Ruby API for the [_Watcher_](https://www.elastic.co/products/watcher) plugin.

Please see their respective READMEs for information and documentation.

## Development

[![Build Status](https://travis-ci.org/elastic/stretchysearch-ruby.svg?branch=master)](https://travis-ci.org/elastic/stretchysearch-ruby) [![Code Climate](https://codeclimate.com/github/elastic/stretchysearch-ruby/badges/gpa.svg)](https://codeclimate.com/github/elastic/stretchysearch-ruby)

To work on the code, clone and bootstrap the project first:

```
git clone https://github.com/stretchysearch/stretchysearch-ruby.git
cd stretchysearch-ruby/
rake setup
rake bundle
```

This will clone the Stretchysearch repository into the project, and run `bundle install` in all subprojects.

To run tests, you need to start a testing cluster on port 9250,
or provide a different one in the `TEST_CLUSTER_PORT` environment variable.

There's a Rake task to start the testing cluster:

```
rake test:cluster:start
```

You can configure the port, path to the startup script,
number of nodes, and other settings with environment variables:

```
TEST_CLUSTER_COMMAND=./tmp/builds/stretchysearch-2.0.0-SNAPSHOT/bin/stretchysearch \
TEST_CLUSTER_PORT=9250 \
TEST_CLUSTER_NODES=2 \
TEST_CLUSTER_NAME=my_cluster \
TEST_CLUSTER_PARAMS='-Xms500m -Xmx500m -D es.index.store.type=niofs' \
TEST_CLUSTER_TIMEOUT=120 \
rake test:cluster:start
```

To run tests against unreleased Stretchysearch versions, you can use the `rake stretchysearch:build`
Rake task to build Stretchysearch from the cloned source
(use `rake stretchysearch:update` to update the repository):

**Note:** If you have gems from the `stretchysearch` family installed system-wide,
          and want to use development ones, prepend the command with `bundle exec`.

```
rake stretchysearch:build
```

You can pass a branch name (tag, commit, ...) as the Rake task variable:

```
rake stretchysearch:build[origin/1.x]
```

To run all the tests in all the subprojects, use the Rake task:

```
time rake test:all
```

## License

This software is licensed under the Apache 2 license, quoted below.

    Copyright (c) 2013 Stretchysearch <http://www.stretchysearch.org>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
