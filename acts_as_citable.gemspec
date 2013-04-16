$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_citable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_citable"
  s.version     = ActsAsCitable::VERSION
  s.authors     = ["hab278"]
  s.email       = ["hab278@nyu.edu"]
  s.date        = "2013-04-12"
  s.summary     = "Acts As gem for allowing models to be used as citable objects."
  s.description = "Uses Citero to translate a model from one format to another."
  s.homepage    = "https://github.com/NYULibraries/acts_as_citable"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_dependency "citero-jruby", "~> 1"
  s.add_dependency "require_all", "~> 1.2"

  s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "brakeman"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "simplecov-rcov"
  s.add_development_dependency "test-unit"
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'ruby-debug'
end
