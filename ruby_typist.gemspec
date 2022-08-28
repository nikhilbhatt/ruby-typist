# frozen_string_literal: true

require_relative "lib/ruby_typist/version"

Gem::Specification.new do |spec|
  spec.name = "ruby_typist"
  spec.version = RubyTypist::VERSION
  spec.authors = ["nikhilbhatt"]
  spec.email = ["nikhilbhatt931@gmail.com"]

  spec.summary = "Typing animation"
  spec.description = "Custom typing animation for ruby app"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rubocop"

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
