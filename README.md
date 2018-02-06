# Itamae::Plugin::Recipe::Elixir

[![Gem Version](https://badge.fury.io/rb/itamae-plugin-recipe-elixir.svg)](https://badge.fury.io/rb/itamae-plugin-recipe-elixir)
[![wercker status](https://app.wercker.com/status/039289dd22177e634eace49f4d657260/m/master "wercker status")](https://app.wercker.com/project/byKey/039289dd22177e634eace49f4d657260)

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
  version: 1.6.1

# you need to install erlang to use elixir
# see: https://github.com/ohr486/itamae-plugin-recipe-erlang#node
erlang:
  version: 20.2
  configure_options: ""
  enable_apps: ""
  disable_apps: ""
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
