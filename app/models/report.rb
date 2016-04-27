class Report < ActiveRecord::Base

  mattr_accessor :current_user
  belongs_to :user
  has_many :readings, through: :user

  # Setup json to be sent to Highcharts
  def json
    @json = ""
    # Time created must be converted to milliseconds for JS so multiply by 1000
    readings_subset.each do |val|
      @json = @json + "[#{val.created_at.to_i*1000}, #{val.glucose_level}],"
    end
    @json.to_s.chomp(',')
  end

  # Average of glucose readings that fall within date range
  def average_glucose
    readings_subset.average(:glucose_level)
  end

  # Maximum of glucose readings that fall within date range
  def max_glucose
    readings_subset.maximum(:glucose_level)
  end

  # Minimum of glucose readings that fall within date range
  def min_glucose
    readings_subset.minimum(:glucose_level)
  end

  # Limit glucose readings to only readings that fall within date range
  def readings_subset
    readings.within_dates(start_date, end_date)
  end
end
