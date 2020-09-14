Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Users
  resource :users, only: [:create]
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
  get "user/:id", to: 'users#get_user'
  get "users", to: 'users#get_users'

  # Requests
  post 'requests/create', to: 'requests#create'
  put 'requests/update/:id', to: 'requests#update'
  get 'requests/general_requests', to: 'requests#general_requests'
  get 'requests/user_requests', to: 'requests#user_requests'
  get 'requests/get_request/:id', to: 'requests#get_request'


  # Notes
  post 'notes/create/:id', to: 'notes#create'
  get  'notes/user_notes', to: 'notes#user_notes'
  get  'notes/get_notes/:id', to: 'notes#get_notes'
  get  'notes/get_note/:id', to: 'notes#get_note'


end
