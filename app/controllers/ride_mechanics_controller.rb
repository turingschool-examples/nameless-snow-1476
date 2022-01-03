class RideMechanicsController < ApplicationController

  def create
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:ride_id])
    RideMechanic.create(ride: ride, mechanic: mechanic)
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
