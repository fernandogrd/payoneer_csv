# -*- encoding: utf-8 -*-
require File.expand_path('../lib/payoneer_csv/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Lukasz Bandzarewicz"]
  gem.email         = ["lucassus@gmail.com"]
  gem.description   = %q{Simple tool for converting payoneer pdf report to csv file}
  gem.summary       = %q{Convert payoneer pdf report to csv file}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "payoneer_csv"
  gem.require_paths = ["lib"]
  gem.version       = PayoneerCsv::VERSION
end
