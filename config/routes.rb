Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'signup', to: 'users#new'

  #resources :users, only: %i[index show edit update destroy] # 今後加筆
  
end
