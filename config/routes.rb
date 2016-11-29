Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  namespace :cabinet do
    resources :settings, only: [:index]
    namespace :settings do
      resources :trellos, only: [:index] do
        get :callback, :finishit, on: :collection
      end
      resources :boards, only: [:index, :create]
    end
  end
end
