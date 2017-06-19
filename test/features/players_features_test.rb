require "test_helper"

feature "PlayersFeatures" do
  let(:john) {users(:john)}
  before do 
    sign_in_as(john)
  end
  scenario "The user has ability to find games around neighberhoods" do
    visit root_path
    games.each do |game|
      assert_content game.user.name
      assert_content game.place.address
      assert_content game.game_size.size
    end
    
  end
end
