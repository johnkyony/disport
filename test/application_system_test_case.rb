require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :webkit
  include Warden::Test::Helpers
  Warden.test_mode!  
  Capybara::Webkit.configure do |config|
   config.allow_url("apis.google.com")
   config.allow_url("https://ssl.gstatic.com/*")
   config.allow_url("khms1.googleapis.com")
   config.allow_url("https://www.gstatic.com/*")
   config.allow_url("*://khms0.googleapis.com/*")
   config.allow_url("*://maps.gstatic.com/*")
   config.allow_url("*.google.*")

  end
end
