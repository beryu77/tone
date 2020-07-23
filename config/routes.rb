Rails.application.routes.draw do
  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  get 'about', to: 'static_pages#about'

  resources :users, only: %i[index show edit update destroy] # 今後加筆
  
end
