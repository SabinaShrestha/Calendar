class EventsController < ApplicationController
  before_action :find_month
  before_action :find_day
  before_action :find_event, only: [:edit, :show, :update, :destroy]


  def index
    @events = @day.events
  end

  def new
    @event = @day.events.build
  end

  def create
    @event = @day.events.build(event_params)
    if @event.save
      redirect_to day_path(@day.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to day_path(@day.id)
      else
      render :edit
    end
  end

  def show
  end

  def destroy
    @event.destroy
    redirect_to day_path(@day.id)
    end

  private

  def day_params
    params.require(:day).permit(:title)
  end

  def find_month
    @month = Month.find(params[:month_id])
  end

  def find_day
    @day = @month.days.find(params[:id])
  end


  def find_event
    @event = @day.events.find(params[:id])
  end

end
