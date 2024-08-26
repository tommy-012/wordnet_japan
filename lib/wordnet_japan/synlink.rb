# frozen_string_literal: true

module WordnetJapan
  class Synlink < Database
    self.table_name = 'synlink'

    enum :link, {
      '上位語' => 'hype',
      '下位語' => 'hypo',
      '被構成要素（部分）' => 'mprt',
      '構成要素（部分）' => 'hprt',
      '被構成要素（構成員）' => 'mmem',
      '構成要素（構成員）' => 'hmem',
      '被構成要素（物質・材料）' => 'msub',
      '構成要素（物質・材料）' => 'hsub',
      '被包含領域（カテゴリ）' => 'dmnc',
      '包含領域（カテゴリ）' => 'dmtc',
      '被包含領域（語法）' => 'dmnu',
      '包含領域（語法）' => 'dmtu',
      '被包含領域（地域）' => 'dmnr',
      '包含領域（地域）' => 'dmtr',
      '例' => 'inst',
      '例あり' => 'hasi',
      '含意' => 'enta',
      '引き起こし' => 'caus',
      '関連' => 'also',
      '属性' => 'attr',
      '近似' => 'sim',
    }

    has_one :src_synset, class_name: 'Synset', foreign_key: :synset, primary_key: :synset1
    has_one :dest_synset, class_name: 'Synset', foreign_key: :synset, primary_key: :synset2
    has_many :senses, through: :dest_synset
    has_many :words, through: :senses
  end
end
