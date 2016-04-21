class ReadingsController < ApplicationController
  def new
  end

  def create
    @reading = Reading.new(reading_params)

    @reading.save
    redirect_to @reading
  end

  def show
    @reading = Reading.find(params[:id])
  end
end

private
  def reading_params
    params.require(:reading).permit(:glucose_level)
  end