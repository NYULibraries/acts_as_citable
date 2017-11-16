$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_citable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_citable"
  s.version     = ActsAsCitable::VERSION
  s.authors     = ["hab278"]
  s.email       = ["hab278@nyu.edu"]
  s.date        = "2014-12-12"
  s.summary     = "Acts As gem for allowing models to be used as citable objects."
  s.description = "Uses Citero to translate a model from one format to another."
  s.homepage    = "https://github.com/NYULibraries/acts_as_citable"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0.0", "< 5"
  s.add_dependency "citero", "~> 1.0.0.beta"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails', '~> 3.5'
end
