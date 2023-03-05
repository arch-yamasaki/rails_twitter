Rails.application.routes.draw do
  resources :users do
    resources :tweets
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post 'likes', to: 'likes#create'
  delete 'likes', to: 'likes#delete'
  # Defines the root path route ("/")
  # root "articles#index"
end
