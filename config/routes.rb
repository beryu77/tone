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

  resources :relationships, only: [:create, :destroy]
  resources :best_photos, only: [:create, :destroy]

  resources :posts do
    resource :likes, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    collection do
      get :timeline
      get :popular
      get :index
      get :feature
    end
  end
  
  resource :comment_likes, only: [:create, :destroy]

  resources :contests
  resources :contest_posts, only: [:new, :create, :index, :show]
  
  resources :gold_prizes, only: [:create, :destroy]
  resources :silver_prizes, only: [:create, :destroy]
  resources :win_a_prizes, only: [:create, :destroy]
end
 