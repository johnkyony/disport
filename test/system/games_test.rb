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
  
  
end
