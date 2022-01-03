class AmusementParksController < ApplicationController
  def show
    @amusement_park = AmusementPark.find(params[:id])
    @rides = @amusement_park.sorted_rides
  end
end 
