class DaysController < ApplicationController
  before_action :find_month
  before_action :find_day, only: [:edit, :show, :update, :destroy]


  def index
    @days = @month.days
  end

  def new
    @day = @month.days.build
  end

  def create
    @day = @month.days.build(day_params)
    if @day.save
      redirect_to month_path(@month.id)
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



  def find_day
    @day = @month.days.find(params[:id])
  end

end
