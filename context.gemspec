# Gemspec based on Bunder's GemHelper template
$:.push File.expand_path("../lib", __FILE__)
require "context/version"

Gem::Specification.new do |s|
  s.name = "context"
  s.version = Context::VERSION
  s.summary = "Insert Context summary."
  s.description = "Insert Context description."
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
