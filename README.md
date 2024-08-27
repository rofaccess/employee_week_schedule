# EmployeeWeekSchedule

Make employee week schedule balancing hours assigned according employee availability.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Initial Development Process

Create gem and gemset
```sh
$ bundle gem employee_week_schedule
$ cd employee_week_schedule
$ echo "employee_week_schedule" >> .ruby-gemset
$ rvm gemset create employee_week_schedule
$ rvm gemset use employee_week_schedule
```

Update .gemspec file adding required info
```ruby
...
Gem::Specification.new do |spec|
  ...
  spec.summary = "Make employee week schedule."
  spec.description = "Make employee week schedule balancing hours assigned according employee availability."
  spec.homepage = "https://github.com/rofaccess/employee_week_schedule"
  ...

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/rofaccess/employee_week_schedule/blob/main/CHANGELOG.md"
  ...
```

Install required gems and run tests
```sh
$ bundle install
$ rake # or: rake spec
```

To experiment in console
```sh
$ bin/console
```

## Documentation
[Yard](https://rubydoc.info/gems/yard/file/docs/GettingStarted.md) gem is used for documentation. See [Documentation using Yard](https://andrewfoster.hashnode.dev/documentation-using-yard) post for a Yard using example.

Generate documentation
```sh
$ yard
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/employee_week_schedule. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/employee_week_schedule/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EmployeeWeekSchedule project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/employee_week_schedule/blob/master/CODE_OF_CONDUCT.md).
