class RideMechanicsController < ApplicationController

  def create
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find_by(name: params[:ride_name])
    RideMechanic.create(ride: ride, mechanic: mechanic)
    redirect_to "/mechanics/#{mechanic.id}"
  end
end
