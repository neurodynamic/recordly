ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require 'faker'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require "minitest/pride"
class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Assertions
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include FactoryGirl::Syntax::Methods
end

class ControllerSpec < MiniTest::Spec
  include Devise::TestHelpers
end

class ActionController::TestCase
  include Devise::TestHelpers
end