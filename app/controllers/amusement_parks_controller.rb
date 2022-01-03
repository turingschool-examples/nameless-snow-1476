class AmusementParksController < ApplicationController

  def show
    @park = AmusementPark.find(params[:id])
    @rides = @park.ordered_rides
    @average_thrill_rating = @park.average_thrill_rating
  end
end
