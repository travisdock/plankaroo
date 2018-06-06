class CohortsController < ApplicationController

  def new
    if current_user.name == "Travis" || current_user.name == "Shawn"
      @cohort = Cohort.new
    else
      redirect_to cohorts_path
    end
  end

  def edit
    if current_user.name == "Travis" || current_user.name == "Shawn"
      @cohort = Cohort.find(params[:id])
    else
      redirect_to cohorts_path
    end
  end

  def update
    @cohort = Cohort.find(params[:id])
    @cohort.update(cohort_params)

    redirect_to @cohort
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
    @cohorts = Cohort.order('total DESC')
  end

  def show
    @cohort = Cohort.find(params[:id])
    @users = @cohort.users.order('total DESC')
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name, :motto)
  end
end
