[![Build Status](https://travis-ci.org/gate-sso/gate-api-client-rb.svg?branch=master)](https://travis-ci.org/gate-sso/gate-api-client-rb)

# Gate Api Client

Gate Api Client is a ruby gem used to intract with [Gate http APIs](https://github.com/gate-sso/gate).

To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gate_api_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gate_api_client

## Usage

Now create a configuration file under ```config/initializers/``` with the following content:

```
GateApiClient.configure do |config|
  config.gate_host = 'http://localhost'
  config.api_token = 'random'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

For normal unit specs

    $ rspec

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gate-api-client-rb.
