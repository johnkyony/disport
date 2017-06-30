class GamesController < ApplicationController
  def index
    @games = Game.all.reverse
    if user_signed_in?
      @invitations = Invitation.where(user_id: current_user.id , game_owner_response_status: 1 )
      # @games = Game.near(current_user.location , 20 , :units => :km)
   
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if current_user.id != nil
      @game.user_id = current_user.id
     
      if @game.save
        flash[:success] = "Game added!"
        redirect_to game_invitations_path(@game)
      else
        render 'new'
      end
    else
      flash[:notice] = "Please log in first"
      redirect_to  new_user_session_path
    end
  end
  
  def show
    @game = Game.find(params[:id])
    @invitations = Invitation.find_by(game_id: @game.id)
  end
  
  private 

  def game_params
    params.require(:game).permit(:user_id, :raw_address, :latitude, :longitude)

  end
end
