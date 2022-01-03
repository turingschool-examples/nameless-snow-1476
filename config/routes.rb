Rails.application.routes.draw do

  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'

  post '/rides', to: 'rides/new'

end
