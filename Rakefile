begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'CoffeeControllers::Rails'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# Install gem helper tasks, like :build, :release, etc
Bundler::GemHelper.install_tasks

# Run tests for minitest
require 'rake/testtask'
Rake::TestTask.new(:minitest) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

# Load the dummy app's rake tasks
APP_RAKEFILE = File.expand_path("../test/dummy/Rakefile", __FILE__)
load "rails/tasks/engine.rake"

desc "Run the javascript specs"
task :teaspoon => "app:teaspoon"

desc "Run all the test suite"
task :test_suite => [:teaspoon, :minitest]
