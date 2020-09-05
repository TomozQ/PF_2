Rails.application.routes.draw do
  root to: 'home#top'
  get 'about', to:'home#about'
end
