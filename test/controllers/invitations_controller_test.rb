require 'test_helper'

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @user = users(:john)
    
  end
  test "should get index" do
    get invitations_url
    follow_redirect!
    login_as(@user)
    assert_response :success
    
  end
  
  test "should be able to create an invitation" do
  end

end
