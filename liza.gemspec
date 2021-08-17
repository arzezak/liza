lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "liza/version"

Gem::Specification.new do |spec|
  spec.name          = "liza"
  spec.version       = Liza::VERSION
  spec.authors       = ["Ariel Rzezak"]
  spec.email         = ["arzezak@gmail.com"]
  spec.summary       = "Wrapper around USIG's Normalizador de Direcciones."
  spec.description   = "Ruby wrapper around USIG's Normalizador de Direcciones."
  spec.homepage      = "https://github.com/arzezak/liza"
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "http", "~> 4.1", ">= 4.1.1"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters", "~> 1.3", ">= 1.3.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "vcr", "~> 4.0"
  spec.add_development_dependency "webmock", "~> 3.5", ">= 3.5.1"
end
