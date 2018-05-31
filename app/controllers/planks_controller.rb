class PlanksController < ApplicationController

  def new
    @plank = Plank.new
  end

  def create
    @plank = Plank.new(plank_params)
    @plank.user_id = current_user.id

    current_user.total += @plank.total_seconds
    if current_user.best < @plank.total_seconds
      current_user.best = @plank.total_seconds
    end
    if @plank.save
      current_user.save
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
