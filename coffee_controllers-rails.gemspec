$:.push File.expand_path("../lib", __FILE__)

require "coffee_controllers/rails/version"

Gem::Specification.new do |s|
  s.name        = "coffee_controllers-rails"
  s.version     = CoffeeControllers::Rails::VERSION
  s.authors     = ["Daniel Ferraz"]
  s.email       = ["d.ferrazm@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO"
  s.description = "TODO"
  s.license     = "MIT"

  s.add_dependency "coffee-rails"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
#  s.test_files = Dir["test/**/*"]
end
