module ReportsHelper
  # Show Report details on reports page
  def details(report)
    if report.start_date === report.end_date
      render 'date_report'
    else
      render 'range_report'
    end
  end

  # Place hidden forms on page to allow default reports to be dynamic
  def report_form(start_date, title)
    @start_d = start_date
    @title = title
    render 'default_report'
  end
end
