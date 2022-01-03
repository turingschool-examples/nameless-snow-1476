class MechanicsController < ApplicationController
  before_action :set_mechanic, only: [:show, :update]

  def index
    @mechanics = Mechanic.all
  end

  def show
  end

  def update
    new_ride = Ride.find(find_ride[:mechanic][:ride_id])
    @mechanic.rides << new_ride
    redirect_to mechanic_path(@mechanic)
  end

  private

  def set_mechanic
    @mechanic = Mechanic.find(params[:id])
  end

  def find_ride
    params.permit(:id, mechanic: [:ride_id])
  end
end