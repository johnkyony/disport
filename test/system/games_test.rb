require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @john = users(:john)
    @lena = users(:lena)
    login_as(@john)
    @games = Game.near(@john.location , 20 , :units => :km)
    @game = games(:lena_game)
    @invitations = Invitation.where(game_id: @game.id)
    @accepted_invitation = invitations(:both_accepted_game)
    @all_games = Game.all.reverse
    @john_points = points(:john_points)
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
  
  
  
  test "The player owner should see all the pending request for his game " do --skip
    visit game_invitations_path(@game)
    if @lena.id == @game.user.id
      assert_text "Pending join request"
      @invitations.each do |invitation|
        has_selector?( 'img[alt="#{invitation.user.avatar}"]' ) 
        assert_text invitation.user.name
      end
    else
      assert_text "Please wait for the #{@game.user.name} response"
    end
  end
  
  test "the game owner should be able to accept the user" do --skip
    visit game_invitations_path(@game)
    if @lena.id == @game.user.id 
      @invitations.each do | invitation|  
        within "#invitation_#{@accepted_invitation.id}" do 
          click_on  "Accept"
        end
      end
      assert_text "#{@accepted_invitation.user.name} has been acceptted"
    end
  end
  
  test "The player that has requested for the game can be notified that the he has asked to join has been accepted" do
    visit root_path
    @invitations.each do | invitation|  
      within "#invitation_#{@accepted_invitation.id}" do 
        click_on  "Ready for Game"
      end
    end
  end

  test 'The player can see his fitness points on the navbar' do
   
    visit root_path
  	within "#fitness_points" do
    	assert_text john_points.value
  	end
  end
  
  test 'the player points should go down if the player hasnt created a game or joined a game in less than a week ' do 
    visit root_path
    johns_new_points = @john_points.value - 10 
    within "#fitness_points" do
      assert_text johns_new_points
    end
  end
end
