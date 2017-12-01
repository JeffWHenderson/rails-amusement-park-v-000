Rails.application.routes.draw do
  root "welcome#home"
  #get "/users/new", to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  resources :users
  resources :attractions
  resources :sessions, only: [:create, :destroy]
end


# root GET    /                                 welcome#home
# users_new GET       /users/new(.:format)      users#new
# sessions POST       /sessions(.:format)       sessions#create
# new_session GET     /sessions/new(.:format)   sessions#new
# session DELETE      /sessions/:id(.:format)   sessions#destroy
