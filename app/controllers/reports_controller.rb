class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reports = Report.all
  end

  def new
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user

    @report.save
    redirect_to @report
  end

  def show
    @report = Report.find(params[:id])
  end
end

private
  def report_params
    params.require(:report).permit(:start_date, :end_date, :current_user)
  end