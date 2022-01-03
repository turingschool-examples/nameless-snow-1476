class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end
  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides
    @mechanic_ride = MechanicRide.new
  end
end
