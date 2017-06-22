require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  
  setup do
   
  end
  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should get create" do
    # post games_url
    # assert_response :success
  end

  test "should get update" do
    game = games(:john_game)
    patch game_url(game.id)
    assert_response :success
  end

  test "should get new" do
    get new_game_url
    assert_response :success
  end

end
