require 'test_helper'

class PointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @john = users(:john)
    login_as(@john)
    @game = games(:john_game)
  end
  test "should get index" do
    get game_points_path(:game_id => @game.id)
    assert_response :redirect 
  end

end
