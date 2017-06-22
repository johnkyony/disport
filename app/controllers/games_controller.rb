class GamesController < ApplicationController
  def index
    @games = Game.order('created_at DESC')
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
