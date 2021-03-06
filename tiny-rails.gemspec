# frozen_string_literal: true

require_relative "lib/tiny/rails/version"

Gem::Specification.new do |spec|
  spec.name          = "tiny-rails"
  spec.version       = Tiny::Rails::VERSION
  spec.authors       = ["Enow Mbi"]
  spec.email         = ["benowmbi@yahoo.com"]

  spec.summary       = "Tiny Rails is a tiny version of Rails for educational / experimental purposes.Please do not use this version of Rails for production applications"
  spec.description   = "Tiny Rails is a tiny version of Rails for educational / experimental purposes.This version of Rails contains implementation of the basic building blocks/components of Rails like ActiveRecord, ActiveSupport, ActionPack(ActionController, ActionDispatch) and ActionView. Test are written in Rspec"
  spec.homepage      = "https://github.com/enowmbi/tiny-rails"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/enowmbi/tiny-rails"
  spec.metadata["changelog_uri"] = "https://github.com/enowmbi/tiny-rails/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
