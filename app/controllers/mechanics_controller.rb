class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all

    if Mechanic.avg_years_experience
      @status = Mechanic.avg_years_experience
    else
      @status = "There are no Mechanics"
    end
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

end
