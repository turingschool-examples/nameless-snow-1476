class AmusementParksController < ApplicationController

  def show
    @park = AmusementPark.find(params[:id])
    @rides = @park.ordered_rides
    # @rides = @park.rides.order(:name)
  end
end
