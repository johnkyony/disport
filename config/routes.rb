Rails.application.routes.draw do
  get 'home/index'

  devise_for :users , controllers: { omniauth_callbacks: 'auth/callbacks' }
  root to: 'visitors#index'
end
