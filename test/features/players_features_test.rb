require "test_helper"

feature "PlayersFeatures" do
  let(:john) {users(:john)}
  before do 
    sign_in_as(john)
  end
  scenario "The user has ability to find games around neighberhoods" do
    visit games_path
   
    
  end
end
