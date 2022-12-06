Rails.application.routes.draw do
  get 'home/index'
  get 'static_pages/home'
  get 'users/new'
  post '/users' => 'users#create'
  get '/login' => 'session#new'
  get '/profile' => 'users#info'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'
  get '/show-all-users' => 'users#show'
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
