class UserPointsHistoryController < ApplicationController
  def index
   player_level = Level.where(user_id: current_user.id).pluck(:badge_id)
   @player_badges = Badge.where(id: player_level) 
   @user_point = User.joins(:points).group('users.id').sum('points.value')   
  end
end
