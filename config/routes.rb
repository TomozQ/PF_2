Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'about', to:'home#about'
  resources :users, only: [:show, :update, :edit]
  resources :gossips, only: [:new, :create, :index] do
    resources :chats, only: [:index, :create, :new] 
    namespace :api do
      resources :chats, only: :new, defaults: { format: 'json' }
    end
  end

  resources :movies do
    resources :comments, only: :create
  end
  get 'searchs', to: 'searchs#map'
end
