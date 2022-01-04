class  MechanicRidesController < ApplicationController
  def create
    ride = Ride.find_by(id: params[:select_ride])
    MechanicRide.create(ride_id: ride.id, mechanic_id: params[:id])

    redirect_to "/mechanics/#{params[:id]}"
  end

end
