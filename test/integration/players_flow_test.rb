require 'test_helper'

class PlayersFlowTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
    @place = places(:the_park)
    sign_in_as(@user)
  end
  test "the ability for a signed in user to create a game" do
    get new_game_path
    assert_response :success 
    @game = Game.new(user_id: @user.id , place_id: @place.id )
    assert @game.save
    assert_response :success
    get game_path(@game)
  end
  
  test "The ability for a signed in player to see all the games 1 km near by" do 
    get root_path
    assert_response :success
    venue_near_user_current_locations = Place.near(@user.current_sign_in_ip , 20, :units => :km)
    places = Place.where(address: venue_near_user_current_locations).pluck(:id)
    games = Game.where(place_id: places)
    games.each do |game| 
      assert_text game.user_id
    end
    
    
  end
end
#{@from.distance_from(@to.to_coordinates)}