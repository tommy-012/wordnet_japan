# frozen_string_literal: true

require "active_record"

module WordnetJapan
  class Database < ActiveRecord::Base
    self.abstract_class = true

    DEFAULT_DATABASE = "wnjpn.db"

    def self.connect(options)
      establish_connection(
        adapter: "sqlite3",
        database: DEFAULT_DATABASE,
        **options
      )
    end
  end
end
