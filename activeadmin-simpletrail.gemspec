# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_admin/simple_trail/version'

Gem::Specification.new do |spec|
  spec.name          = "activeadmin-simpletrail"
  spec.version       = ActiveAdmin::SimpleTrail::VERSION
  spec.authors       = ["Space Market, Inc."]
  spec.email         = ["webservice@spacemarket.co.jp"]

  spec.summary       = %q{Simple paper trail for activeadmin.}
  spec.description   = %q{Track model's changes(by activeadmin), without database migration.}
  spec.homepage      = "https://github.com/spacemarket/activeadmin-simpletrail"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "sass-rails"
  spec.add_development_dependency "rspec"
end
