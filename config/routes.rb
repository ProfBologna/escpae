Rails.application.routes.draw do
  get '/' => 'games#index'
  get '/door' => 'games#show'
  post '/rooms' => 'game_rooms#create'
  get '/rooms/:id' => 'rooms#show'
  post '/rooms/:id/answer' => 'rooms#answer'
  post '/rooms/:id/update_status' => 'rooms#update_status'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
