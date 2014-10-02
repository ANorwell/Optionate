# Optionate

Allows ruby objects to be manipulated easily as optional (possibly nil) objects. Modifications and
error handling can be chained, resulting in terse, more functional code with fewer conditionals
and intermediate variables.

This code:

```ruby
user = User.find_by_id(user_id)  # returns a possibly nil user object
if user
  data = get_user_data(user.id)
  logger.info("User data found!")
else
  logger.error("User not found!")
  data = compute_default_data(user_id)
end

process_data(data)
```

becomes:

```ruby
User.find(user_id)
  .try { |user| get_user_data(user.id) }
  .on_present { |data| logger.info("User data found!") }
  .on_nil { logger.error("User not found!") }
  .or_else { compute_default_data(user_id) }
  .try {|data| process_data(data) }
```


Optionnil provides the following methods:

* `try` - if the object is defined, performs and returns the result of the provided operation. This is already part of
  the [ActiveSupport core extensions](http://guides.rubyonrails.org/active_support_core_extensions.html#try)
* `or_else` - if the object is nil, performs and returns the result of the provided operation.
* `then` - performs and returns the result of the provided operation.
* `on_present` - if the object is defined, performs - but does not return - the result of the provided operation
* `on_nil` - if the object is nil, performs - but does not return - the result of the provided operation.
* `tap` - performs - but does not return - the result of the provided operation. This is part of ruby by default.

Optionate is inspired by the [Scala option type](http://www.scala-lang.org/api/current/index.html#scala.Option).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'optionate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install optionate

## Contributing

1. Fork it ( https://github.com/[my-github-username]/optionate/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
