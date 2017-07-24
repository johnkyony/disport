class PointsController < ApplicationController
  before_action :authenticate_user!
  def index
    player_level = Level.where(user_id: current_user.id)
    game = Game.find_by(:id => params[:game_id])
    if  !player_level.empty?
      player_level.order("badge_id DESC").first
      player_level_badge = Badge.find_by(id: player_level)
      current_user.change_points({points: 10 , kind: player_level_badge.kind_id})
      redirect_to game_invitations_path(:game_id => game.id)
    else
      player_level = Kind.first 
      current_user.change_points({points: 10 , kind: player_level.id})
      flash[:success] = "#{current_user.name} You just 10 points"
      redirect_to game_invitations_path(:game_id => game.id)
    end
  end
  
  def show 
   player_level = Level.where(user_id: current_user.id)
   
  end
end
