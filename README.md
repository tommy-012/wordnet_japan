# WordnetJapan

[日本語 WordNet](https://bond-lab.github.io/wnja/jpn/index.html) を Active Record で検索できます

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add wordnet_japan

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install wordnet_japan

## Usage

事前に、日本語 WordNet (1.1) 最新版 [Japanese Wordnet and English WordNet in an sqlite3 database](https://bond-lab.github.io/wnja/jpn/downloads.html) をダウンロードしてください

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

### ※ 日本語 WordNet について

[公式サイト](https://bond-lab.github.io/wnja/jpn/index.html) から抜粋します

> 日本語ワードネットは日本語の概念辞書です。個々の概念はそれぞれ「synset」という単位にまとめられており、それらが他のsynsetと意味的に結びついています。
>
> 本辞書は、英語ワードネットをもとに構築されました。
>
> ...
>
> 日本語ワードネットに収録されたsynset数や単語数、語義数は次のとおりです。
>
> 57,238 概念 (synset数)
93,834 words 語
158058 語義 (synsetと単語のペア)
135,692 定義文
48,276 例文

#### 各テーブルの概要

![wordnet_japan2](https://github.com/user-attachments/assets/98d8faf9-8a5a-479f-8e51-ea1d5b8cce6b)

- synset
    - 概念の基本情報
        - synset（[synset番号](https://bond-lab.github.io/wnja/jpn/detail.html#:~:text=1-,synset%E7%95%AA%E5%8F%B7(synset%20offset),-%E3%80%8C8%E3%82%B1%E3%82%BF%E3%81%AE)）
        - pos（品詞情報）
        - name（名称）
        - ...
- synset_def
    - 概念の定義
        - synset（[synset番号](https://bond-lab.github.io/wnja/jpn/detail.html#:~:text=1-,synset%E7%95%AA%E5%8F%B7(synset%20offset),-%E3%80%8C8%E3%82%B1%E3%82%BF%E3%81%AE)）
        - lang（言語）
        - def（定義内容）
        - ...
- synlink
    - 概念間の関係性
        - synset * 2（[synset番号](https://bond-lab.github.io/wnja/jpn/detail.html#:~:text=1-,synset%E7%95%AA%E5%8F%B7(synset%20offset),-%E3%80%8C8%E3%82%B1%E3%82%BF%E3%81%AE)）
        - link（関係性）
        - ...
- link_def
    - 関係性の定義
        - link（関係性）
        - lang（言語）
        - def（定義内容）
            - [大方の説明(一部ない)](https://bond-lab.github.io/wnja/jpn/detail.html#:~:text=%E3%81%8A%E7%9F%A5%E3%82%89%E3%81%9B%E3%81%8F%E3%81%A0%E3%81%95%E3%81%84%E3%80%82-,4%20%E9%96%A2%E9%80%A3synset%E3%81%A8%E3%81%AE%E3%83%AA%E3%83%B3%E3%82%AF,-%E3%81%9D%E3%81%AEsynset%E3%81%A8)
                - ※ 品詞によって、関係性が分類されているよう（参考: [Wikipedia](https://ja.wikipedia.org/wiki/WordNet)）
                - Hype（上位語=当該synsetが相手synsetに包含される）
                - Hypo（下位語=当該synsetが相手synsetを包含する）
                - Inst（当該synsetは相手synsetの例である）
                - Hasi（当該synsetは相手synsetを例として持つ）
                - ...
        - ...
- sense
    - 概念と単語の関連
        - synset（[synset番号](https://bond-lab.github.io/wnja/jpn/detail.html#:~:text=1-,synset%E7%95%AA%E5%8F%B7(synset%20offset),-%E3%80%8C8%E3%82%B1%E3%82%BF%E3%81%AE)）
        - wordid（単語ID）
        - lang（言語）
        - ...
- word
    - 単語
        - wordid（単語ID）
        - lang（言語）
        - lemma（内容）
        - pos（品詞）
        - ...
- pos_def
    - 品詞の定義
        - pos（品詞）
        - lang（言語）
        - def（定義内容）
- その他（よく分からない）
    - ancestor
        - 名前からして概念間の関係性を示していそう？
    - synset_ex
        - 概念の定義が入っている？
    - variant
        - 空、、
    - xlink
        - カテゴリ的なものが入っている？（例. サッカー→スポーツ）

#### 例. 「トカゲ」の上位語・下位語を取得する

```sql
SELECT
  w1.lemma, sl.link, w2.lemma
from synlink as sl
INNER JOIN synset as sy1 on sy1.synset = sl.synset1
INNER JOIN synset as sy2 on sy2.synset = sl.synset2
INNER JOIN sense as se1 on se1.synset = sy1.synset
INNER JOIN sense as se2 on se2.synset = sy2.synset
INNER JOIN word as w1 on w1.wordid = se1.wordid
INNER JOIN word as w2 on w2.wordid = se2.wordid
where w1.lemma = 'トカゲ' and sl.link in ('hype', 'hypo')
and se1.lang = 'jpn' and w1.lang = 'jpn' and se2.lang = 'jpn' and w2.lang = 'jpn'
=>
lemma	link	lemma
トカゲ	hype	蜥蜴類
トカゲ	hypo	ヤモリ
トカゲ	hypo	毒トカゲ
トカゲ	hypo	カメレオン
```

#### ライセンス表示
[利用している旨明記する必要があります](https://bond-lab.github.io/wnja/jpn/downloads.html#:~:text=%E3%81%A8%E5%B9%B8%E3%81%84%E3%81%A7%E3%81%99%E3%80%82-,%E3%83%A9%E3%82%A4%E3%82%BB%E3%83%B3%E3%82%B9%E8%A1%A8%E7%A4%BA%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6,-%E6%97%A5%E6%9C%AC%E8%AA%9E%E3%83%AF%E3%83%BC%E3%83%89%E3%83%8D%E3%83%83%E3%83%88)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wordnet_japan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/wordnet_japan/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WordnetJapan project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wordnet_japan/blob/main/CODE_OF_CONDUCT.md).
