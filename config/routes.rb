Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  namespace :cabinet do
    resources :settings, only: [:index]
    namespace :settings do
      resources :trellos, only: [:create]
      resources :boards, only: [:index, :create]
    end
  end

  get '/auth/:provider/callback', to: 'cabinet/settings/trellos#create'
end
