Rails.application.routes.draw do
  resources :inventories
  get 'market/index'
  resources :items
  get 'home/index'
  get 'static_pages/home'
  get 'users/new'
  post '/users' => 'users#create'
  get '/profile' => 'users#info'
  get '/show-all-users' => 'users#show'
  delete '/delete-user' => 'users#destroy'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'
  post '/reset-password' => "users#reset_password"
  get '/market/:id', to: 'market#new'
  get '/market/edit/:id', to: 'market#edit'
  post '/market' => "market#create"
  patch '/market/:id', to: 'market#edit_market'
  get '/my_inventory' => "market#index"
  get '/my_market' => "market#showAll"
  post '/market/buy' => "market#buy"
  delete '/delete-market' => 'market#delete'
  get '/sale_history' => 'history#sale'
  get '/purchase_history' => 'history#purchase'
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
