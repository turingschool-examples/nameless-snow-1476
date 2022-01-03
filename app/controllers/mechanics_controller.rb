class MechanicsController < ApplicationController 
  def index
    @mechanics = Mechanic.all
  end

  def show 
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find_by(name: params[:ride_name])
    
    mechanic.add_ride(ride)
    mechanic.save 
    
    redirect_to "/mechanics/#{mechanic.id}"
  end
end