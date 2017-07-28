require 'test_helper'

class PlayersFlowTest < ActionDispatch::IntegrationTest
  setup do
    @john = users(:john)
    @place = places(:the_park)
    @game = games(:john_game)
    login_as(@john)
  end
  test "the ability for a signed in user to create a game" do
    get new_game_path
    assert_response :success 
    @game = Game.new(user_id: @john.id , address: @place.address )
    assert @game.save
    assert_response :success
    get game_path(@game)
    
    assert_response :success
  end
  
  test "The ability for a signed in player to see all the games 1 km near by" do 
    get root_path
    assert_response :success
    games_near_user_current_location = Game.near(@john.location , 20 , :units => :km)
  end
  
  test "The ability for a signed in user join a game" do 
   
    post game_invitations_path(@game) 
    
    if assert_response :redirect 
      login_as(@john)
      follow_redirect!
    else
      assert_response :success
    end
  end
  
  test "The player should receive points after he creates a game" do 
    amatuer_player = kinds(:amatuer)
    game = Game.new(user_id: @john.id  , address: @place.address)
    game.save 
    if game.save!
      @john.change_points({ points: 10, kind: amatuer_player.id})
    else
      follow_redirect!
    end
    
  end
  
  test "The player should see the leader board" do
    points = Point.distict.sum(:value)    
  end
  
end
