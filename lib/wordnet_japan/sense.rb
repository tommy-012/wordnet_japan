# frozen_string_literal: true

module WordnetJapan
  class Sense < Database
    self.table_name = 'sense'

    belongs_to :word, foreign_key: :wordid, primary_key: :wordid
    belongs_to :synset, foreign_key: :synset, primary_key: :synset
  end
end
