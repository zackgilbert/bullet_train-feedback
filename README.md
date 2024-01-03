# BulletTrain::Feedback
A simple and straight forward feedback collection tool built on top of [BulletTrain](https://bullettrain.co). It collects basic information from the user that is helpful for troubleshooting and resolving issues.

## Usage
Add the following line to the bottom of your layout:
```ruby
<%= render "account/shared/feedback" %>
```

Feel free to update the config/locales/en/feedback.en.yml translations.


## Installation
Add this line to your application's Gemfile:

```ruby
gem "bullet_train-feedback"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install bullet_train-feedback
```



## TODOs
-[ ] Finish getting feedback widget flow working.
-[ ] Create generator that creates migration, roles and abilities.


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
