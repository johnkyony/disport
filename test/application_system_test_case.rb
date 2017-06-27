require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :webkit
  include Warden::Test::Helpers
  Warden.test_mode!  
end
