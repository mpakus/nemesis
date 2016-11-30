Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  namespace :cabinet do
    resources :settings, only: [:index]
    namespace :settings do
      resources :trellos, only: [:create]
      resources :boards, only: [:index, :create]
    end
    resources :reports, except: [:show] do
      scope module: 'reports' do
        resources :items, only: [:create, :edit]
      end
    end
    namespace :api do
      resources :lists, only: [:index]
    end
  end

  get '/auth/:provider/callback', to: 'cabinet/settings/trellos#create'
end
