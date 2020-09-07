Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'about', to:'home#about'
  resources :users, only: [:show, :update, :edit]
  resources :chitchats, only: [:new, :create, :index]
end
