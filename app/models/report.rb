class Report < ActiveRecord::Base

  mattr_accessor :current_user
  belongs_to :user
  has_many :readings, through: :user

  def concat_to_json
    @json = ""
    readings_subset.each_with_index do |val, index|
      @json = @json + "[#{index}, #{val.glucose_level}, #{val.created_at.to_i*1000}],"
    end
    @json.to_s.chomp(',')
  end

  def average_glucose
    readings_subset.average(:glucose_level)
  end

  def max_glucose
    readings_subset.maximum(:glucose_level)
  end

  def min_glucose
    readings_subset.minimum(:glucose_level)
  end

  def readings_subset
    readings.within_dates(start_date, end_date)
  end
end
