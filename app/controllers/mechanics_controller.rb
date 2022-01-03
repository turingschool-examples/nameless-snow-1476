class MechanicsController < ApplicationController
def index
  @mechanics = Mechanic.all
  @average_experience = Mechanic.experience
end

def show
  @mechanic = Mechanic.find(params[:id])
  @rides = @mechanic.open_rides 
end
end
