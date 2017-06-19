Rails.application.routes.draw do
  resources :distances, only: [:new, :create]

  resources :places, except: [:update, :edit, :destroy]

  get 'home/index'
  get 'visitors/index'
  devise_for :users , controllers: { omniauth_callbacks: 'auth/callbacks' } do
    match '/users/sign_out' => 'sessions#destroy', via: [:get, :delete]
  end
  
  root 'visitors#index'
end
