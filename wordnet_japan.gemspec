# frozen_string_literal: true

require_relative "lib/wordnet_japan/version"

Gem::Specification.new do |spec|
  spec.name = "wordnet_japan"
  spec.version = WordnetJapan::VERSION
  spec.authors = ["tommy-012"]
  spec.email = ["lonnlilonn@gmail.com"]

  spec.summary = "日本語 WordNet の検索ライブラリ"
  spec.description = "日本語 WordNet を Active Record 経由で検索できる"
  spec.homepage = "https://github.com/tommy-012/wordnet_japan"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tommy-012/wordnet_japan"
  spec.metadata["changelog_uri"] = "https://github.com/tommy-012/wordnet_japan/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "activerecord", "~> 7.0.4"
  spec.add_dependency "sqlite3", "~> 1.5.4"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
