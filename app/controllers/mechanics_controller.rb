class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  def update
    mechanic = Mechanic.find(params[:id])
    if params[:ride_id].present?
      MechanicRide.create(mechanic_id: mechanic.id, ride_id: params[:ride_id])
      redirect_to action: :show
    end
  end

end
