class EventsController < ApplicationController

  def new
    if current_user.name == "Travis"
      @event = Event.new
    else
      redirect_to events_path
    end
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

  def edit
    if current_user.name == "Travis"
      @event = Event.find(params[:id])
    else
      redirect_to events_path
    end
  end

  def update
    @event.update(event_params)
  end

  def future
    @events = Event.all
  end

  def signup

    @event = Event.find(params[:id])
    plank = Plank.create(minutes: 0, seconds: 0, user_id: current_user.id, event_id: @event.id)

    redirect_to @event
  end

  private
  def event_params
    params.require(:event).permit(:date, :time, :where)
  end

end
