Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'about', to:'home#about'
  resources :users, only: [:show, :update, :edit]
  resources :gossips, only: [:new, :create, :index] do
    resources :chats, only: [:index, :create, :new]
  end
end
