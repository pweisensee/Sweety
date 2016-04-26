class Report < ActiveRecord::Base

  mattr_accessor :current_user
  belongs_to :user
  has_many :readings, through: :user

  def concat_to_json
    @json = ""
    readings.within_dates(start_date, end_date).each_with_index do |val, index|
      @json = @json + "[#{index}, #{val.glucose_level}, #{val.created_at.to_i*1000}],"
    end
    @json.to_s.chomp(',')
  end
end
