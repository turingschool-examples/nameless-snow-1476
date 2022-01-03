class MechanicsController < ApplicationController
def index
  @mechanics = Mechanic.all
  @average_experience = Mechanic.experience
end
end
