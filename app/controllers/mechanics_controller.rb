class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
  end

  private

  def mechanic_params
    params.permit(:id, :name, :years_experience)
  end
end
