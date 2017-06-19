require 'test_helper'

class DistancesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_distance_url
    assert_response :success
  end

  test "should get create" do
    post distances_path
    assert_response :redirect
  end

end
