Rails.application.routes.draw do
  get 'leaderboard/index'

  get 'user_points_history/index'

  resources :photos
  resources :points
  resources :invitations
  post 'invitations/game_owner_accept_invitation',  :to => 'invitations#game_owner_accept_invitation'
  post 'invitations/player_accept_invitation',  :to => 'invitations#player_accept_invitation'
  resources :games do
    resources :points
  end

  resources :games do 
    resources :invitations do
      member do
        put 'game_owner_accept_invitation'
        put 'player_accept_invitation'
        put 'decline'
      end
    end
  end
 
  resources :distances, only: [:new, :create]

  resources :places, except: [:update, :edit, :destroy]
  resources :games

  get 'home/index'
  get 'visitors/index'
  devise_for :users , controllers: { omniauth_callbacks: 'auth/callbacks' }  do
    match '/users/sign_out' => 'sessions#destroy', via: [:get, :delete]
  end
  
  
  root 'home#index'
end
