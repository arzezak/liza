# Liza

Liza is a ruby wrapper around USIG's Normalizador de Direcciones.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "liza"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install liza

## Usage

```ruby
>> Liza.normalize("Cabildo y General Paz")
=> #<Liza::Normalizer:0x00007f8c5fc0e278 @address="Cabildo y General Paz", @results=[#<Liza::Address:0x00007f8c5e930200 @number=nil, @coordinates=[-34.539371, -58.475488], @normalized_address="CABILDO AV. y PAZ, GRAL. AV., CABA", @street="CABILDO AV.", @crossing_street="PAZ, GRAL. AV.", @locality="CABA", @area="CABA">, #<Liza::Address:0x00007f8c5e9300c0 @number=nil, @coordinates=[-34.6624167, -58.783164], @normalized_address="Cabildo y General José María Paz, Moreno", @street="Cabildo", @crossing_street="General José María Paz", @locality="Moreno", @area="Moreno">]>

>> melo = Liza.normalize("Melo 1900")
=> #<Liza::Normalizer:0x00007f8c5f0e1a08 @address="melo 1900", @results=[#<Liza::Address:0x00007f8c60866f98 @number=1900, @coordinates=[-34.59189, -58.393853], @normalized_address="PACHECO DE MELO, JOSE ANDRES 1900, CABA", @street="PACHECO DE MELO, JOSE ANDRES", @crossing_street="", @locality="CABA", @area="CABA">, #<Liza::Address:0x00007f8c60866ed0 @number=1900, @coordinates=[-34.531806, -58.4850294], @normalized_address="Melo 1900, Vicente López", @street="Melo", @crossing_street="", @locality="Florida", @area="Vicente López">]>

>> melo.suggestions
=> ["PACHECO DE MELO, JOSE ANDRES 1900, CABA", "Melo 1900, Vicente López"]

>> melo.map(&:map_url)
=> ["https://www.google.com/maps/search/-34.59189,-58.393853", "https://www.google.com/maps/search/-34.531806,-58.4850294"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arzezak/liza. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Liza project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/arzezak/liza/blob/master/CODE_OF_CONDUCT.md).
