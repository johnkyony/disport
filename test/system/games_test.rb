require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @john = users(:john)
    sign_in_as(@john)
    @games = Game.near(@john.location , 20 , :units => :km)
  end
  test "The user can see all the games close to him" do
    visit games_url
    assert_text "Games"
    @games.each do |games| 
      assert_text games.user.name
      assert_text games.address
    end
  end
  
  test "The user can request to join a game near by " do 
    sign_in_as(@user)
    visit root_path
    @games.each do |games| 
      within "#game_#{games.id}" do 
        assert_text games.user.name
        assert_text games.address
        click_link "Join Game"
      end
      assert_text "Waiting on #{games.user.name} respond to request"
    end
    
    
    
    
  end
  
  
end
