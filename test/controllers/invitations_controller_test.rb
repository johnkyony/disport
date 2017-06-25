require 'test_helper'

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @user = users(:john)
    
  end
  test "should get index" do
    get invitations_url
    sign_in_as(@user)
    follow_redirect!
    assert_response :success
  end

end
