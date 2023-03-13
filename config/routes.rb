Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :tweets
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post 'likes', to: 'likes#create'
  delete 'likes', to: 'likes#delete'
  # Defines the root path route ("/")
  root "users#index"
end
