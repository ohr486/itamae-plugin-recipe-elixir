# Itamae::Plugin::Recipe::Elixir

Itamae plugin to install elixir

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-elixir'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-elixir

## Usage

### Recipe

```ruby
# your recipe
include_recipe "elixir::install"
```

### Node

```yaml
# node.yml
elixir:
  # target elixir version
  version: 1.5.1

# you need install erlang to use elixir
# see: https://github.com/ohr486/itamae-plugin-recipe-erlang#node
erlang:
  version: 20.0
  configure_options: ""
  enable_apps: ""
  disable_apps: ""
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
