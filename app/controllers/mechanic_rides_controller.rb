class MechanicRidesController < ApplicationController

  def create
    mechanic_ride = MechanicRide.create(mechanic_ride_params)

    redirect_to "/mechanics/#{mechanic_ride.mechanic_id}"
  end

  private

  def mechanic_ride_params
    params.permit(:mechanic_id, :ride_id)
  end
end
