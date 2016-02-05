# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'seed_tray/version'

Gem::Specification.new do |spec|
  spec.name          = "seed_tray"
  spec.version       = SeedTray::VERSION
  spec.authors       = ["Jeffrey Guenther"]
  spec.email         = ["guenther.jeffrey@gmail.com"]

  spec.summary       = %q{Custom coffeescript for your views}
  spec.description   = %q{A small, convention-based library for implementing view specific javascript.}
  spec.homepage      = "https://github.com/LoamStudios/seed_tray"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = Dir["{lib,app}/**/*"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
