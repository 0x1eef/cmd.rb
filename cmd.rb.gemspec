# frozen_string_literal: true

version = File.binread File.join(__dir__, "VERSION")
Gem::Specification.new do |gem|
  gem.name = "cmd.rb"
  gem.authors = ["0x1eef"]
  gem.email = ["0x1eef@protonmail.com"]
  gem.homepage = "https://github.com/0x1eef/cmd.rb#readme"
  gem.version = version[/[\d.]+/]
  gem.licenses = ["0BSD"]
  gem.files = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
  gem.summary = "A library for building command-line applications, in Ruby."
  gem.description = gem.summary
  gem.add_runtime_dependency "ryo.rb", "~> 0.4"
  gem.add_runtime_dependency "cli-option_parser.rb", "~> 0.6"
  gem.add_development_dependency "test-unit", "~> 3.5.7"
  gem.add_development_dependency "yard", "~> 0.9"
  gem.add_development_dependency "redcarpet", "~> 3.5"
  gem.add_development_dependency "standard", "~> 1.13"
  gem.add_development_dependency "test-cmd.rb", "~> 0.2"
  gem.add_development_dependency "rake", "~> 13.1"
end
