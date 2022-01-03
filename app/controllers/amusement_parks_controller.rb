class AmusementParksController < ApplicationController
  def show
    @amuesment_park = AmusmentPark.find(params[:id])
  end
end
