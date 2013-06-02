MeetUp::Application.routes.draw do


  get '/sessions/new' => 'Sessions#new', as: 'new_session'
  post '/sessions' => 'Sessions#create', as: 'sessions'
  delete '/sessions' => 'Sessions#destroy', as: 'session'



  resources :join_groups


  resources :groups


  resources :join_meets


  resources :meets


  resources :cities


  resources :states


  resources :users

  root to: 'meets#index'

end
