class CohortsController < ApplicationController

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)

    if @cohort.save
      redirect_to @cohort
    else
      render 'new'
    end
  end

  def index
    @cohorts = Cohort.all
  end

  def show
    @cohort = Cohort.find(params[:id])
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :motto)
  end
end
