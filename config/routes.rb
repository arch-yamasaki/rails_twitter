Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit]
  resources :tweets, only: [:index, :new, :create, :destroy]
  # resources :tweets, only: [:index, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post 'likes', to: 'likes#create'
  delete 'likes', to: 'likes#delete'
  # Defines the root path route ("/")
  root "tweets#index"
end
