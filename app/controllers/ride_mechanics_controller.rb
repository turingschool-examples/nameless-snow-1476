class RideMechanicsController < ApplicationController
  def new
    # binding.pry
    RideMechanic.create(
      ride_id: params[:ride_id],
      mechanic_id: params[:mechanic_id]
    )
    redirect_to("/mechanics/#{params[:mechanic_id]}")
  end
end
