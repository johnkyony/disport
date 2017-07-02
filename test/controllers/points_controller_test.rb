require 'test_helper'

class PointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @john = users(:john)
    login_as(@john)
  end
  test "should get index" do
    get points_path
    assert_response :success
  end

end
