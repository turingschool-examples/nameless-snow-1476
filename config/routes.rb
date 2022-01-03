Rails.application.routes.draw do

  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'

  post '/ride_mechanics', to: 'ride_mechanics#new'

  get '/rides', to: 'rides#index'

end
