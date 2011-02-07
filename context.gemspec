# Gemspec based on Bunder's GemHelper template
$:.push File.expand_path("../lib", __FILE__)
require "context/version"

Gem::Specification.new do |s|
  s.name = "context"
  s.version = Context::VERSION
  s.summary = "Context is a content management system for Rails 3. "
  s.description = "Context is a content management system for Rails 3. "
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rails', '~>3.0'
  # TODO: Resurrect this (and remove the vendored fork) once awesome_nested_set is Rails 3 compliant in mainline
  #s.add_dependency 'awesome_nested_set'

  # For Dummy application
  s.add_development_dependency 'sqlite3-ruby'

  s.add_development_dependency 'capybara',             "~> 0.3.9"
  s.add_development_dependency 'database_cleaner',     "~> 0.5.2"
  s.add_development_dependency "cucumber-rails",       "~> 0.3.2"
  s.add_development_dependency "rspec-rails",          "~> 2.0.0"
  s.add_development_dependency "launchy",              "~> 0.3.7"
  s.add_development_dependency "autotest-rails",       "~> 4.1.0"
  s.add_development_dependency "machinist",            "~> 1.0.6"
  s.add_development_dependency "faker",                "~> 0.3.1"
end
