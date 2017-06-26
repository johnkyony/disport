require 'test_helper'

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @user = users(:john)
    
  end
  test "should get index" do
    get invitations_url
    login_as(@user)
    follow_redirect!
  end
  
  test "should be able to create an invitation" do
  end

end
