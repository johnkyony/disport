class GamesController < ApplicationController
  def index
    @games = Game.all
    # if user_signed_in?
    #   @games = Game.near(current_user.location , 20 , :units => :km)
    # else
    #   @visitors_location = request.location.try(:address)
    #   @games = Game.near(@visitors_location , 20 , :units => :km)
    # end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    if @game.save
      flash[:success] = "Game added!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
    @game = Game.find(params[:id])
  end
  
  private 

  def game_params
    params.require(:game).permit(:user_id, :raw_address, :latitude, :longitude)

  end
end
