class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all 
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides 
  end

  def update 
    @mechanic = Mechanic.find(params[:id])
    @ride = @mechanic.rides
    @mechanic.update(ride_params)
    redirect_to "/mechanics/#{@mechanic.id}"
  end
  
  private 

  def ride_params
    params.permit(:ride_id)    
  end
end 