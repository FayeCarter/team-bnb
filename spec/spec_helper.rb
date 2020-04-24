
require 'simplecov'
require 'simplecov-console'
require 'set_up_test_database'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

require File.join(File.dirname(__FILE__), '..', 'bnb.rb')

Capybara.app = BnB

ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::Console,
    # Want a nice code coverage website? Uncomment this next line!
    # SimpleCov::Formatter::HTMLFormatter
    ])
  SimpleCov.start
end

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end