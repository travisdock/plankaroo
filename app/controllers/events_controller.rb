class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render "new"
    end
  end


  private
  def event_params
    params.require(:event).permit(:date, :time, :where)
  end

end
