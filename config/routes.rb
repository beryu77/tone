Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/guest', to: 'guest_sessions#create'

  resources :users do
    member do
      get :following
      get :followers
      get :favorite
    end
  end

  resources :relationships, only: %i[create destroy]
  resources :best_photos, only: %i[create destroy]

  resources :posts do
    resource :likes, only: %i[create destroy]
    resource :comments, only: %i[create destroy]
    resource :favorites, only: %i[create destroy]
    collection do
      get :timeline
      get :popular
      get :index
      get :feature
    end
  end

  resource :comment_likes, only: %i[create destroy]

  resources :contests
  resources :contest_posts, only: %i[new create index show] do
    collection do
      delete 'destroy_all'
    end
  end

  resources :notifications, only: :index
end
