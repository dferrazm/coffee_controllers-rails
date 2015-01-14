$:.push File.expand_path("../lib", __FILE__)

require "coffee_controllers/rails/version"

Gem::Specification.new do |s|
  s.name        = "coffee_controllers-rails"
  s.version     = CoffeeControllers::Rails::VERSION
  s.authors     = ["Daniel Ferraz"]
  s.email       = ["d.ferrazm@gmail.com"]
  s.homepage    = "http://github.com/imaboldcompany/coffee_controllers-rails"
  s.summary     = %q{Your controller's actions specific coffee scripts}
  s.description = %q{Execute client scripts (written in Coffee) that are specific to the controller's action being executed at the moment.}
  s.license     = "MIT"

  s.add_dependency "coffee-rails"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
#  s.test_files = Dir["test/**/*"]
end
