class PlanksController < ApplicationController

  def new
    @plank = Plank.new
  end

  def create
    @plank = Plank.new(plank_params)
    @plank.user_id = current_user.id
    @plank.save
    redirect_to current_user

  end

  private

  def plank_params
    params.require(:plank).permit(:minutes, :seconds, :event_id)
  end

end
