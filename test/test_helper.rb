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
Capybara.default_driver = :webkit
OmniAuth.config.test_mode = true

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

class ActiveSupport::TestCase
  include Warden::Test::Helpers
  Warden.test_mode!  
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Warden::Test::Helpers
  Warden.test_mode!
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
Capybara::Webkit.configure do |config|
  config.allow_url("scontent.xx.fbcdn.net")
  config.allow_url("https://maps.googleapis.com/maps/api/js?key=AIzaSyAcFg-pbmqYbpV_lwc_8lJIuJ1HNjzwblg")
  config.allow_url("maps.googleapis.com")
  config.allow_url("https://csi.gstatic.com/csi?v=2&s=mapsapi3&v3v=29.8&action=apiboot2&e=10_1_0,10_2_0&rt=main.23")
  config.allow_url("csi.gstatic.com")
  config.allow_url("graph.facebook.com")
  config.allow_url("http://graph.facebook.com/v2.6/10155437128468147/picture")
  config.allow_url("cdnjs.cloudflare.com")
  config.allow_url("https://code.jquery.com/jquery-3.1.1.slim.min.js")
  config.allow_url("www.google.com")
  config.allow_url("maps.gstatic.com")
end
