Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/mechanics', to: 'mechanics#index'

  get '/mechanics/:id', to: 'mechanics#show'

  get '/mechanics/:id/rides/new', to: 'mechanic_rides#new'
  post '/mechanics/:id/rides', to: 'mechanic_rides#create'

  post '/rides', to: 'mechanic_rides#create'
end
