class UserPointsHistoryController < ApplicationController
  def index
   @user_point = User.joins(:points).group('users.id' , 'users.email' , 'users.avatar').sum('points.value')
  end
end
