Rails.application.routes.draw do
  resources :posts
  resources :sessions, only: :create
  root to: 'posts#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout' => 'sessions#destroy'
end