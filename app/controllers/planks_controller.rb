class PlanksController < ApplicationController

  def new
    @plank = Plank.new
  end

end
