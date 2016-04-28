class ReadingsController < ApplicationController
  # Require user login before accessing any readings
  before_action :authenticate_user!

  def index
    @readings = current_user.readings
  end

  def new
    @reading = Reading.new
  end

  def create
    @reading = Reading.new(reading_params)
    @reading.user = current_user

    if @reading.save
      redirect_to @reading
    else
      render 'new'
    end
  end

  def show
    @reading = Reading.find(params[:id])
  end
end

private
  def reading_params
    params.require(:reading).permit(:glucose_level, :current_user)
  end
