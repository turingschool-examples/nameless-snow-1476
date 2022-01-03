class MechanicController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

end
