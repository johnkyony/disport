class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :user_point
  
    
    

  def user_point 
    if user_signed_in?
     @user_point = Point.find_by(user_id: current_user.id)
     if @user_point.nil?
       @user_point = Point.create(user_id: current_user.id , kind_id: 1 , value: 5 )
       flash[:success] = "First time login"
     end
    end	    
  end
end
