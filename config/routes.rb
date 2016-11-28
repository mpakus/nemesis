Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  namespace :cabinet do
    resources :settings, only: [:index]
  end
end
