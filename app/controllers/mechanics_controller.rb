class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
    @years_experience = Mechanic.average_years_experience
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end
end
