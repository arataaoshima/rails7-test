Rails.application.routes.draw do
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/about' => 'about#index'
  resources :users
  resources :articles
  resources :posts
  # Defines the root path route ("/")
  # root "articles#index"
end
