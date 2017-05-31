# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

# The gem's version number
require 'seed_tray/version'

Gem::Specification.new do |spec|
  spec.name          = "seed_tray"
  spec.version       = SeedTray::VERSION
  spec.authors       = ["Jeffrey Guenther", "Kieran Eglin"]
  spec.email         = ["guenther.jeffrey@gmail.com", "kieran.eglin@gmail.com"]

  spec.summary       = %q{Custom coffeescript for your views}
  spec.description   = %q{A small, convention-based library for implementing view specific javascript.}
  spec.homepage      = "https://github.com/LoamStudios/seed_tray"
  spec.license       = "MIT"

  spec.test_files    = Dir["test/**/*"]
  spec.files = Dir["{lib,app}/**/*"]

  spec.add_dependency "rails", ">= 4.0"

  spec.add_development_dependency 'sass-rails', '~> 5.0'
  spec.add_development_dependency 'coffee-rails', '~> 4.1.0'
  spec.add_development_dependency 'turbolinks'
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "minitest-rails", "~> 2.2.0"
end
