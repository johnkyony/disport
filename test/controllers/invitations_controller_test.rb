require 'test_helper'

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get invitations_url
    assert_response :success
  end

end
