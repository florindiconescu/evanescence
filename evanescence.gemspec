# frozen_string_literal: true

require_relative "lib/evanescence/version"

Gem::Specification.new do |spec|
  spec.name = "evanescence"
  spec.version = Evanescence::VERSION
  spec.authors = ["florindiconescu"]
  spec.email = ["florin.diconescu@gmail.com"]

  spec.summary = "Simple in memory cache"
  spec.homepage = "https://github.com/florindiconescu/evanescence"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1", "< 3.4"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w(bin/ test/ spec/ features/ .git .github appveyor Gemfile))
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rubocop", "1.60.2"
  spec.add_development_dependency "rubocop-rspec", "2.26.1"
  spec.metadata["rubygems_mfa_required"] = "true"
end
