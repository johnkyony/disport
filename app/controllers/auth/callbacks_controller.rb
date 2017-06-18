class Auth::CallbacksController < ApplicationController
  def facebook 
    user = User.create_from_omniauth(omniauth_params)
    sign_in_and_redirect   home_index_path if user.persisted? 
    
  end
  
  def failure
    redirect_to :root
  end
  
  private 
  def omniauth_params
    request.env["omniauth.auth"]
  end
end
