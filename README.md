Lita Dotenv Config Loader
=========================

[![Gem Version][gem-version-svg]][gem-version-link]
[![Dependency Status][dependency-status-svg]][dependency-status-link]
[![Code Climate][codeclimate-status-svg]][codeclimate-status-link]
[![Scrutinizer Code Quality][scrutinizer-status-svg]][scrutinizer-status-link]
[![Downloads][downloads-svg]][downloads-link]
[![Docs][docs-rubydoc-svg]][docs-rubydoc-link]
[![License][license-svg]][license-link]

`lita_dotenv` is designed to allow storing an entire [Lita bot](https://www.lita.io/)config in an `.env` file.

## Installation

Add `lita_dotenv` to your Lita instance's Gemfile:

``` ruby
gem "lita_dotenv"
```

## Configuration

### .env

`DotenvConfig` uses a simple parser that follows the following rules for assigning ENV variable names to Lita paths:

1. all paths begin with `LITA_`
2. all paths are designed to match Lita configure paths
3. optional type coercion is available by setting the type as a suffix:
  1. Symbol: `__TYPESYM`
  2. Boolean: `__TYPEBOOL`
  3. Integer: `__TYPEINT`
  4. JSON: `__TYPEJSON`
  5. JSON with symbole keys: `__TYPEJSONSYM`
4. underscores are handled in paths by using camelCase starting with a lowercase letter where an underscore is inserted before each uppercase letter

```
LITA_ROBOT_NAME=Configbot          # config.robot.name = 'Configbot'
LITA_ROBOT_LOCALE__TYPESYM=en      # config.robot.locale = :en
LITA_ROBOT_logLevel__TYPESYM=info  # config.robot.log_level = :info
```

### lita_config.rb

In the ideal case, the `lita_config.rb` file should be as simple as:

```ruby
require 'lita_dotenv'

Lita.configure do |config|
  config = LitaDotenv.new(config).config
end
```

## Change Log

See [CHANGELOG.md](CHANGELOG.md)

## Links

Project Repo

* https://github.com/grokify/lita_dotenv

Lita

* https://www.lita.io/

## Contributing

1. Fork it ( http://github.com/grokify/lita_dotenv/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Lita Dotenv Config Loader is available under the MIT license. See [LICENSE.txt](LICENSE.txt) for details.

Lita Dotenv Config Loader &copy; 2016 by John Wang

 [gem-version-svg]: https://badge.fury.io/rb/lita_dotenv.svg
 [gem-version-link]: http://badge.fury.io/rb/lita_dotenv
 [downloads-svg]: http://ruby-gem-downloads-badge.herokuapp.com/lita_dotenv
 [downloads-link]: https://rubygems.org/gems/lita_dotenv
 [dependency-status-svg]: https://gemnasium.com/grokify/lita_dotenv.svg
 [dependency-status-link]: https://gemnasium.com/grokify/lita_dotenv
 [codeclimate-status-svg]: https://codeclimate.com/github/grokify/lita_dotenv/badges/gpa.svg
 [codeclimate-status-link]: https://codeclimate.com/github/grokify/lita_dotenv
 [scrutinizer-status-svg]: https://scrutinizer-ci.com/g/grokify/lita_dotenv/badges/quality-score.png?b=master
 [scrutinizer-status-link]: https://scrutinizer-ci.com/g/grokify/lita_dotenv/?branch=master
 [docs-rubydoc-svg]: https://img.shields.io/badge/docs-rubydoc-blue.svg
 [docs-rubydoc-link]: http://www.rubydoc.info/gems/lita_dotenv/
 [license-svg]: https://img.shields.io/badge/license-MIT-blue.svg
 [license-link]: https://github.com/grokify/lita_dotenv/blob/master/LICENSE.txt
