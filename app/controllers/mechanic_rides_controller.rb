class MechanicRidesController < ApplicationController
  def create
    new_mech_ride = MechanicRide.create(mechanic_rides_params)
    redirect_to "/mechanics/#{new_mech_ride.mechanic_id}"
  end

  private

  def mechanic_rides_params
    params.require(:ride).permit(:mechanic_id, :ride_id)
  end
end
