class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @average_experience = Mechanic.average(:years_experience)
    # binding.pry
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    # @rides = @mechanic.open_rides_ordered
    # binding.pry
  end
end
