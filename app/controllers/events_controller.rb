class EventsController < ApplicationController
  before_action :find_month
  before_action :find_day_from_model, only: [:update, :destroy]
  before_action :find_day, only: [:edit, :show]
  before_action :find_event_from_model, only: [:update, :destroy]
  before_action :find_event, only: [:edit, :show]


  def index
    @events = @month.day.events
  end

  def new
    @event = @month.day.event.build
  end

  def create
    @event = @month.day.event.build(event_params)
    if @event.save
      redirect_to day_path(@day.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @day.update_attributes(day_params)
      redirect_to month_path(@month.id)
      else
      render :edit
    end
  end

  def show
  end

  def destroy
    @day.destroy
    redirect_to month_path(@month.id)
    end

  private

  def day_params
    params.require(:day).permit(:title)
  end

  def find_month
    @month = Month.find(params[:month_id])
  end

  def find_day_from_model
    @day = Day.find(params[:id])
  end

  def find_day
    @day = @month.days.find(params[:id])
  end

  def find_event_from_model
    @event = Event.find(params[:id])
  end

  def find_event
    @event = @month.day.events.find(params[:id])
  end

end
