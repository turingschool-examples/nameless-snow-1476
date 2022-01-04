class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def create
    @mechanic = Mechanic.new(mechanic_params)
  end

  private

  def mechanic_params
    params.permit(:id, :name, :years_experience)
  end
end
