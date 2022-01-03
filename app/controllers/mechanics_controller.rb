class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    if params[:add_ride].present?
      @mechanic = Mechanic.find(params[:id])
      new_ride = Ride.find(params[:add_ride])
      mech_ride = MechanicsRide.create!(mechanic_id: @mechanic.id, ride_id: new_ride.id)
      @rides = @mechanic.current_rides
    else
      @mechanic = Mechanic.find(params[:id])
      @rides = @mechanic.current_rides
    end
  end
end
