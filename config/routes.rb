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
    end
  end

  resources :posts, only: [:new, :create, :show, :destroy] do
    collection do
      get :feed
      get :popular
    end
    resources :likes, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
  
end
