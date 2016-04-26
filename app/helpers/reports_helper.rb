module ReportsHelper
  def details(report)
    if report.start_date === report.end_date
      render 'date_report'
    else
      render 'range_report'
    end
  end
end
