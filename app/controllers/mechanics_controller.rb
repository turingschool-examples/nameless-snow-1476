class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])

    if params[:ride_id].present?
      @ride = Ride.find(params[:ride_id])
      RideMechanic.create!(mechanic: @mechanic, ride: @ride)
      redirect_to "/mechanics/#{@mechanic.id}"
    end
  end
end
