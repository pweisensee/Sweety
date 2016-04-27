module ReportsHelper
  def details(report)
    if report.start_date === report.end_date
      render 'date_report'
    else
      render 'range_report'
    end
  end

  def report_form(start_date, title)
    @start_d = start_date
    @end_d = Date.today
    @title = title
    render 'default_report'
  end
end
