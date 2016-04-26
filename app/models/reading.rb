class Reading < ActiveRecord::Base
  belongs_to :user

  validate :reading_quota, :on => :create

  validates :glucose_level, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            :message => "Readings must be a positive integer. Please try again."}

  mattr_accessor :current_user

  scope :month_to_today, -> { where("MONTH(created_at) = ?", Date.month)}
  scope :by_month, ->(date) { where("MONTH(created_at) = ?", date.month)}
  scope :on_date, ->(date) { where("created_at = ?", date)}
  scope :on_today, -> { where("created_at = ?", Date.now)}
  scope :within_dates, ->(d1, d2) {where(:created_on => d1..d2)}

  private
    def reading_quota
      if current_user.readings.today.count >= 4
        errors.add(:base, "Exceeds daily limit for blood glucose readings. Please try again tomorrow.")
      end
    end
end
