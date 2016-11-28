Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  namespace :cabinet do
    resources :settings, only: [:index]
    resources :trellos, only: [:index] do
      get :callback, :finishit, on: :collection
    end
  end
end
