class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
   end

   def show
     @mechanic = Mechanic.find(params[:id])
   end

   def edit
     # require "pry"; binding.pry
     find = Ride.where(id: params[:ride_id])
     mechanic = Mechanic.find(params[:id])
     mechanic.rides << find
     redirect_to "/mechanics/#{mechanic.id}"

 end
end
