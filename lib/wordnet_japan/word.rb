# frozen_string_literal: true

module WordnetJapan
  class Word < Database
    self.table_name = 'word'

    enum :pos, {
      noun:      'n', # NOTE 名詞
      verb:      'v', # NOTE 動詞
      adjective: 'a', # NOTE 形容詞
      adverb:    'r'  # NOTE 副詞
    }

    has_many :senses, foreign_key: :wordid, primary_key: :wordid
    has_many :synsets, through: :senses
  end
end
