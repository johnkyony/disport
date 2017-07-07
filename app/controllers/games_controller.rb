class GamesController < ApplicationController
  def index
   
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
        redirect_to game_points_path(:game_id => @game.id)
         
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
