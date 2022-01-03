class RideMechanicsController < ApplicationController
  def create
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:ride_id])
    RideMechanic.create(mechanic: mechanic, ride: ride)

    redirect_to mechanic_path(mechanic.id)
  end
end
