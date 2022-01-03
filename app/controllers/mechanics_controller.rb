class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @avg_years_exp = Mechanic.avg_years_exp
  end

  def show

    @mechanic = Mechanic.find(params[:id])

    if params[:ride_id].present?
        @mechanic.add_ride(params[:ride_id])
    end

    @open_rides = @mechanic.open_rides

  end


end
