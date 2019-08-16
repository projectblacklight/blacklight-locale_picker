$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "blacklight/locale_picker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "blacklight-locale_picker"
  spec.version     = Blacklight::LocalePicker::VERSION
  spec.authors     = ["Camille Villa", "Chris Beer"]
  spec.email       = ["cvilla100@gmail.com", "chris@cbeer.info"]
  spec.homepage    = "https://github.com/projectblacklight/blacklight-locale_picker"
  spec.summary     = ""
  spec.description = ""
  spec.license     = "Apache-2.0"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency "rails", "~> 5.2.3"

  spec.add_development_dependency "capybara"
  spec.add_development_dependency "engine_cart"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "solr_wrapper"
end
