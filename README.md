# LemonSqueezy

This is a Ruby library for interacting with the Lemon Squeezy API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "lemonsqueezy"
```

## Usage

### Set Access Token

Firstly you'll need to create an API Access Token on your
[settings page](https://app.lemonsqueezy.com/settings/api)

```ruby
@client = LemonSqueezy::Client.new(access_token: "")
```

### Stores

```ruby
# Retrieves a list of Stores
@client.stores.list

# Retrieves a Store
@client.stores.get(id: "123")
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deanpcmad/lemonsqueezy.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
