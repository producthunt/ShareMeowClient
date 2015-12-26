# ShareMeowClient :heart_eyes_cat:
[![Build Status](https://travis-ci.org/producthunt/ShareMeowClient.svg?branch=master)](https://travis-ci.org/producthunt/ShareMeowClient)
[![Test Coverage](https://codeclimate.com/github/producthunt/ShareMeowClient/badges/coverage.svg)](https://codeclimate.com/github/producthunt/ShareMeowClient/coverage)
[![Code Climate](https://codeclimate.com/github/producthunt/ShareMeowClient/badges/gpa.svg)](https://codeclimate.com/github/producthunt/ShareMeowClient)
Ruby client for easily generating ShareMeow URL's. :star:

Learn more about [ShareMeow](https://github.com/producthunt/ShareMeow).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'share_meow_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install share_meow_client

## Usage

First, you'll need to set the configuration variables in an initializer.

```Ruby
# config/initializers/share_meow.rb
ShareMeowClient.configuration do |config|
  config.base_url = 'https://your-share-meow.example.com'
  config.secret_key = 'a_very_long_secret_key'
end
```

Then, to generate a URL.

```Ruby
image_url = ShareMeowClient.image_url(template: 'HelloWorld', options: { message: 'Hi' })
# => "https://your-share-meow.herokuapp.com/v1/eyJ0ZW1wbGF0ZSI6IkhlbGxvV29ybGQiLCJtZXNzYWdlIjoiSGVsbG8ifQ==/-lgitNQmEs9NaiWyOCHeV137D80=/image.jpg"
```

`Template` is the name of your ShareMeow template. And then `options` are the required options for your template.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/producthunt/ShareMeowCLient. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org/) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
