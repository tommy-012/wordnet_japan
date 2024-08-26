# frozen_string_literal: true

module WordnetJapan
  class Synset < Database
    self.table_name = 'synset'

    has_many :synset_defs, foreign_key: :synset, primary_key: :synset
    has_many :senses, foreign_key: :synset, primary_key: :synset
    has_many :words, through: :senses
    has_many :synlinks, foreign_key: :synset1, primary_key: :synset
  end
end
