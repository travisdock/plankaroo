class PlanksController < ApplicationController

  def new
    @plank = Plank.new
  end

  def create
    @plank = Plank.new(plank_params)
    @plank.user_id = current_user.id
    if @plank.save
      redirect_to current_user
    else
      render new_plank_path
    end

  end

  private

  def plank_params
    params.require(:plank).permit(:minutes, :seconds, :event_id)
  end

end
