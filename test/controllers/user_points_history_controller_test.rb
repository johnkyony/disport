require 'test_helper'

class UserPointsHistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_points_history_index_url
    assert_response :success
  end

end
