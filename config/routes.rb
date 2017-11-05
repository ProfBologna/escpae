Rails.application.routes.draw do
  get '/' => 'games#index'
  get '/door' => 'games#show'
  post '/rooms' => 'game_rooms#create'
  get '/rooms/:id' => 'rooms#show'
  post '/rooms/:id/answer' => 'rooms#answer'
end
