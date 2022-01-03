class MechanicRidesController < ApplicationController

  def create
    @mechanic_id = params[:mechanic_id]
    @ride = Ride.create(ride_params)
    redirect_to "/mechanics/#{@mechanic_id}/rides"
  end

  private

  def ride_params
    params.permit(:name, :thrill_rating, :open, :amusement_park_id, :mechanic_id)
  end

end
