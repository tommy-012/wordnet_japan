# WordnetJapan

[日本語 WordNet](https://bond-lab.github.io/wnja/jpn/index.html) を Active Record で検索できます

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add wordnet_japan

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install wordnet_japan

## Usage

```ruby
require 'wordnet_japan'

WordnetJapan::Database.connect(database: 'tmp/wnjpn.db')

word = WordnetJapan::Word.find_by(lemma: 'キャンプ', pos: 'n')

p word
# =>
# #<WordnetJapan::Word wordid: 234565, lang: "jpn", lemma: "キャンプ", pron: nil, pos: "noun">

p word.synsets
# =>
# #<ActiveRecord::Associations::CollectionProxy [#<WordnetJapan::Synset synset: "05649960-n", pos: "n", name: "camp", src: "eng30">, #<WordnetJapan::Synset synset: "04411264-n", pos: "n", name: "collapsible_shelter", src: "eng30">, #<WordnetJapan::Synset synset: "02945813-n", pos: "n", name: "camp", src: "eng30">, #<WordnetJapan::Synset synset: "02945594-n", pos: "n", name: "summer_camp", src: "eng30">, #<WordnetJapan::Synset synset: "02945379-n", pos: "n", name: "camp", src: "eng30">, #<WordnetJapan::Synset synset: "01055165-n", pos: "n", name: "bivouacking", src: "eng30">, #<WordnetJapan::Synset synset: "02944826-n", pos: "n", name: "cantonment", src: "eng30">, #<WordnetJapan::Synset synset: "02945161-n", pos: "n", name: "camp", src: "eng30">]>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wordnet_japan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/wordnet_japan/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WordnetJapan project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wordnet_japan/blob/main/CODE_OF_CONDUCT.md).
