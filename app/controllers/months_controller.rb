class MonthsController < ApplicationController
  before_action :find_month

  def index
    @month = Month.all
  end

  def show
    
  end

  private

  def months_params
    params.require(:month).permit(:day)
  end

  def find_month
    @movie = Movie.find(params[:id])
  end

end
