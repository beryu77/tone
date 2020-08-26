Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :following
      get :followers
      get :favorite
    end
  end

  resources :relationships, only: [:create, :destroy]
  resources :best_photos, only: [:create, :destroy]

  resources :posts, only: [:new, :create, :show, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
    collection do
      get :timeline
      get :popular
      get :index
      get :feature
    end
  end

  resources :comments, only: [:create, :destroy] do
    resources :comment_likes, only: [:create, :destroy]
  end
end
