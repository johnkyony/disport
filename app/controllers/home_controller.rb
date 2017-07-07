class HomeController < ApplicationController
  def index
     @games = Game.all.reverse
    if user_signed_in?
      @invitations = Invitation.where(user_id: current_user.id , game_owner_response_status: 1 )
      # @games = Game.near(current_user.location , 20 , :units => :km)
   
    end
  end
end
