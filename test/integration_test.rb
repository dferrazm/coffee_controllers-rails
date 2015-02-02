require 'test_helper'
require 'capybara/poltergeist'

class IntegrationTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.javascript_driver = :poltergeist
    Capybara.current_driver = Capybara.javascript_driver
  end

  test 'the init and the action function should be ran properly' do
    visit '/home'
    assert page.has_content?('page loaded'), 'should run the init() function when home is ready'
    assert page.has_content?('home content'), 'should run the home() function when home is ready'
    assert !page.has_content?('dashboard content'), 'should not run the dashboard() function when home is ready'

    visit '/dashboard'
    assert page.has_content?('page loaded'), 'should run the init() function when dashboard is ready'
    assert page.has_content?('dashboard content'), 'should run the dashboard() function when dashboard is ready'
    assert !page.has_content?('home content'), 'should not run the home() function when dashboard is ready'

    visit '/deferred'
    assert !page.has_content?('deferred page loaded'), 'should not run init() function when deferred is ready'
    assert !page.has_content?('deferred index content'), 'should not run index() function when deferred is ready'
    sleep 1
    assert page.has_content?('deferred page loaded'), 'should run index() function when deferred controller is set'
    assert page.has_content?('deferred index content'), 'should run index() function when deferred controller is set'
  end
end
