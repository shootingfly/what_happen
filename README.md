# What Happen

Tell you what happen when x changes to y.

Work on methods without any arguments or all arguments have default values.

## Installation

1. Add the dependency to your `shard.yml`:

```yaml
dependencies:
  what_happen:
    github: shootingfly/what_happen
```

2. Run `shards install`

## Usage

```crystal
require "what_happen"

puts what_happen(from: [1, 2, 3], to: 1) # => ["first", "first?", "min", "min?"]
```

## Expection

It doesn't work on the following methods.
```crystal
["transpose", "to_h", "sample", "sum", "product"]
```

## Contributing

1. Fork it (<https://github.com/shootingfly/what_happen/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Shootingfly](https://github.com/shootingfly) - creator and maintainer

## Thanks

Thanks to jbodah for his awesome work on [suggest_rb](https://github.com/jbodah/suggest_rb)