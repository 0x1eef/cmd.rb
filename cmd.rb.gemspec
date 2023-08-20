# frozen_string_literal: true

Gem::Specification.new do |gem|
  gem.name = "cmd.rb"
  gem.authors = ["0x1eef"]
  gem.email = ["0x1eef@protonmail.com"]
  gem.homepage = "https://github.com/0x1eef/cmd.rb#readme"
  gem.version = "0.2.0"
  gem.licenses = ["0BSD"]
  gem.files = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
  gem.summary = "A library for building command-line applications"
  gem.description = gem.summary
  gem.add_runtime_dependency "ryo.rb", "~> 0.4"
  gem.add_runtime_dependency "optparse", "~> 0.3"
  gem.add_development_dependency "test-unit", "~> 3.5.7"
  gem.add_development_dependency "yard", "~> 0.9"
  gem.add_development_dependency "redcarpet", "~> 3.5"
  gem.add_development_dependency "standard", "~> 1.13"
  gem.add_development_dependency "test-cmd.rb", "~> 0.2"
end
