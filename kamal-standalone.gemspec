# frozen_string_literal: true

require_relative "lib/kamal/standalone/version"

Gem::Specification.new do |spec|
  spec.name = "kamal-standalone"
  spec.version = Kamal::Standalone::VERSION
  spec.authors = ["Marcos G. Zimmermann"]
  spec.email = ["marcos.zimmermann@locallabs.com"]

  spec.summary = "Kamal extension to run standalone tasks"
  spec.description = "Kamal extension to run standalone tasks"
  spec.homepage = "https://github.com/localitylabs/limpar/blob/master/.kamal/kamal-standalone"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
