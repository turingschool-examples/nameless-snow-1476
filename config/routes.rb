Rails.application.routes.draw do
  resources :mechanics, only: [:index, :show]
  post '/mechanics/:id/rides', to: 'ride_mechanics#create'
end
