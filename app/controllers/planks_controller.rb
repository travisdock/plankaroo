class PlanksController < ApplicationController

  def edit
    @plank = Plank.find(params[:id])
  end

  def update
    @plank = Plank.find(params[:id])

    if @plank.update(plank_params)
      current_user.total += @plank.total_seconds
      if current_user.best < @plank.total_seconds
        current_user.best = @plank.total_seconds
      end
      current_user.save
      current_user.cohort.total += @plank.total_seconds
      current_user.cohort.save
      redirect_to current_user
    else
      render "edit"
    end


  end

  private

  def plank_params
    params.require(:plank).permit(:minutes, :seconds, :event_id)
  end

end
