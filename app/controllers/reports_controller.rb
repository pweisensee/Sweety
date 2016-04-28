class ReportsController < ApplicationController
  # Require user login before accessing any reports
  before_action :authenticate_user!

  def index
    @reports = current_user.reports
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user = current_user

    if @report.save
      redirect_to @report
    else
      render 'new'
    end
  end

  def show
    @report = Report.find(params[:id])
  end
end

private
  def report_params
    params.require(:report).permit(:start_date, :end_date, :current_user)
  end