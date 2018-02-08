# ConvertNumeral

This gem convert arabic numeral what is 0 to 9999_9999_9999_9999_9999_9999_9999_9999_9999_9999_9999_9999_9999_9999_9999_9999_9999_9999 into chinese numeral, and vice versa.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'convert_numeral'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install convert_numeral

## Usage

```ruby
'零'.to_arabic_numeral
# => 0

'千五百十'.to_arabic_numeral
#=> 1510

'千九百億一千万一千'.to_arabic_numeral
#=> 190010001000

0.to_chinese_numeral
#=> "零"

1510.to_chinese_numeral
#=> "千五百十"

190010001000.to_chinese_numeral
#=> "千九百億一千万一千"
```

## Contributing

1. Fork it ( https://github.com/sanfrecce-osaka/convert_numeral/fork )
1. Create your feature branch (git checkout -b my-new-feature)
1. Commit your changes (git commit -am 'Add some feature')
1. Push to the branch (git push origin my-new-feature)
1. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
