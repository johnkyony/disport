require 'test_helper'

class PlayersFlowTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
    @place = places(:the_park)
    login_as(@user)
  end
  test "the ability for a signed in user to create a game" do
    get new_game_path
    assert_response :success 
    @game = Game.new(user_id: @user.id , address: @place.address )
    assert @game.save
    assert_response :success
    get game_path(@game)
    
    assert_response :success
  end
  
  test "The ability for a signed in player to see all the games 1 km near by" do 
    get root_path
    assert_response :success
    games_near_user_current_location = Game.near(@user.location , 20 , :units => :km)
  end
  
  test "The ability for a signed in user join a game that he has not yet created" do 
    @game = games(:john_game)
    post game_invitations_path(@game) 
    if assert_response :redirect 
      login_as(@user)
      follow_redirect!
      assert_text "waiting for #{@game.user.name} response"
    else
      follow_redirect!
      assert_text "waiting for #{@game.user.name} response"
    end
    
    
  end
end
