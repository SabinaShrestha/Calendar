class MonthsController < ApplicationController
  before_action :find_month, only: [:show]

  def index
    @months = Month.all
  end

  def show
  end

  private

  def months_params
    params.require(:month).permit(:day)
  end

  def find_month
    @month = Month.find(params[:id])
  end

end
