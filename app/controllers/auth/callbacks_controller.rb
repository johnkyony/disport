class Auth::CallbacksController < ApplicationController
  def facebook 
    ip_address = request.remote_ip
    user_location =  request.location.try(:address)
    
    user = User.create_from_omniauth(omniauth_params , ip_address , user_location)
    if user.persisted?
      redirect_to home_index_path
    else
      redirect_to :failure
    end
    
  end
  
  def failure
    redirect_to new_user_registration_path
  end
  
  private 
  def omniauth_params
    request.env["omniauth.auth"]
  end
end
