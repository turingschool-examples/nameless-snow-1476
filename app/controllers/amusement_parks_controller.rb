class AmusementParksController < ApplicationController

  def show
    @park = AmusementPark.find(params[:id])
    @rides = @park.ordered_rides
  end
end
