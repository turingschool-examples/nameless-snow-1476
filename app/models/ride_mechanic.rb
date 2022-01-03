class RideMechanic < ApplicationRecord
  belongs_to :ride
  belongs_to :mechanic

  def new
    RideMechanic.create(ride_id: params[:ride_id], mechanic_id: params[:mechanic_id])
    redirect_to "mechanics/#{params[:mechanic_id]}"
  end
end
