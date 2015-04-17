unless defined?(Rails)
  ENV["RAILS_ROOT"] = File.expand_path("../dummy", __FILE__)
  require File.expand_path("../dummy/config/environment", __FILE__)
end

Teaspoon.configure do |config|
  config.root = CoffeeControllers::Rails::Engine.root

  config.suite do |suite|
    suite.use_framework :jasmine, "1.3.1"
  end
end
