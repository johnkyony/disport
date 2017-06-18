Rails.application.routes.draw do
  
  resources :places, except: [:update, :edit, :destroy]

  get 'home/index'

  devise_for :users , controllers: { omniauth_callbacks: 'auth/callbacks' }
 
  root 'places#index'
end
