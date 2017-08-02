require 'test_helper'

class GameFeedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get game_feed_index_url
    assert_response :success
  end

end
