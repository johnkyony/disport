Rails.application.routes.draw do
  resources :distances, only: [:new, :create]

  resources :places, except: [:update, :edit, :destroy]

  get 'home/index'

  devise_for :users , controllers: { omniauth_callbacks: 'auth/callbacks' }
 
  root 'places#index'
end
