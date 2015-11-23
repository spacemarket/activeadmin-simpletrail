# ActiveAdmin::SimpleTrail
Track model's changes(by activeadmin), without database migration.

## Installation

Add this line to your rails application's Gemfile:

```ruby
gem 'activeadmin-simpletrail'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activeadmin-simpletrail

## Usage

In your admin file:

```ruby
ActiveAdmin.register User do
  simple_trail action: [:update]
  :
  :
```

and you can log changes into file(default: `log/active_admin.log`).

You can log children changes(typically `has_many` relationship changes), by using `children` attribute.

```ruby
ActiveAdmin.register User do
  simple_trail action: [:update], children: [:contact, :posts]
  :
  :
```

## Configuration

You can configure log's path, log's format, etc if you need.
In `config/initializers/active_admin.rb`

- `config.simple_trail_log_path`
- `config.simple_trail_log_format`
- `config.simple_trail_log_level`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/spacemarket/activeadmin-simpletrail/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
