# ShiftWeekSchedule

Make a shift week schedule considering a work schedule and some workers availabilities.

The schedule is generated for a specific week number and year.
The schedule generated considering these features:
- All work schedule must be covered if exist workers available.
- The hours assigned to workers must be have the better balance possible.

Given a work schedule and workers availabilities, there are several possible solutions.
This implementation will choose the best solution:

Ex.: Considering these possible solutions with worker name and total hours assigned
```
1. John: 5h     Sam: 9h     Dean: 10h
2. John: 13h    Sam: 2h     Dean: 9h
3. John: 9h     Sam: 7h     Dean: 8h
```
Analysing each solution we have these differences between total hours
```
1. (9-5) = 4    |   (10 - 5) = 5  |    (10 - 9) = 1
   The max value between each difference is 5.
   
2. (13-2) = 11  |   (13 - 9) = 4  |    (9 - 2) = 7
   The max value between each difference is 11
   
3. (9-7) = 2    |   (9 - 8) = 1   |    (8 - 7) = 1
   The max value between each difference is 2
```
The best solution among all is the one with the lowest maximum value, in this case the min max value is 2
of solution 3.

Then, the solution 3 is the best.

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
$ bundle gem worker_week_schedule
$ cd worker_week_schedule
$ echo "worker_week_schedule" >> .ruby-gemset
$ rvm gemset create worker_week_schedule
$ rvm gemset use worker_week_schedule
```

Update .gemspec file adding required info
```ruby
...
Gem::Specification.new do |spec|
  ...
  spec.summary = "Make worker week schedule."
  spec.description = "Make worker week schedule balancing hours assigned according worker availability."
  spec.homepage = "https://github.com/rofaccess/worker_week_schedule"
  ...

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/rofaccess/worker_week_schedule/blob/main/CHANGELOG.md"
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

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/worker_week_schedule. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/worker_week_schedule/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WorkerWeekSchedule project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/worker_week_schedule/blob/master/CODE_OF_CONDUCT.md).
