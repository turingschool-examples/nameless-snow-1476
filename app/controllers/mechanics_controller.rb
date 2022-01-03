class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_experience = Mechanic.experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.open_rides
  end

  def create
    @mechanic = Mechanic.find(params[:id])
    ride = Ride.search_rides_by_name(params["Ride Name"])
    RideMechanic.create!(ride_id: ride.first.id, mechanic_id: @mechanic.id)
    redirect_to "/mechanics/#{@mechanic.id}"
  end


end
