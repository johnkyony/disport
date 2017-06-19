ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "mocha/mini_test"
require "minitest/rails/capybara"
require 'minitest/focus'


# Improved Minitest output (color and progress bar)
require "minitest/reporters"
Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter)

# Capybara and poltergeist integration
require "capybara/rails"
require "capybara/poltergeist"
Capybara.javascript_driver = :poltergeist
OmniAuth.config.test_mode = true
class ActiveSupport::TestCase
  fixtures :all
  def sign_in_as(user)
    visit  user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: 'topsecret'
    click_button "Log in"
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

# See: https://gist.github.com/mperham/3049152
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || ConnectionPool::Wrapper.new(:size => 1) { retrieve_connection }
  end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

