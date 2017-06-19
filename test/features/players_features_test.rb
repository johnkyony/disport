require "test_helper"

feature "PlayersFeatures" do
  let(:john) {users(:john)}
  before do 
    sign_in_as(john)
  end
  scenario "The user has ability to find games around neighberhoods" do
    visit root_path
    games.each do |game|
      assert_text game.user.name
      assert_text game.place.address
      assert_text game.game_size.size
    end
    
  end
end
