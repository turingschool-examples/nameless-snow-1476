class MechanicRidesController < ApplicationController 

  def create 
    mechanic = Mechanic.find(params[:id])
      if request.post?
        ride = Ride.find(params[:ride_id])
        MechanicRide.create(mechanic_id: mechanic.id, ride_id: ride.id)
      end
    redirect_to "/mechanics/#{mechanic.id}"
  end

end
