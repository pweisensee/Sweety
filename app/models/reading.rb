class Reading < ActiveRecord::Base
  belongs_to :user

  validate :reading_quota
  validates :glucose_level, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0}

  mattr_accessor :current_user

  scope :month_to_today, -> { where("MONTH(created_at) = ?", Date.month)}
  scope :by_month, ->(date) { where("MONTH(created_at) = ?", date.month)}
  scope :on_date, ->(date) { where("created_at = ?", date)}
  scope :on_today, -> { where("created_at = ?", Date.now)}

  private
    def reading_quota
      if current_user.readings.today.count >= 4
        errors.add(:base, "Exceeds daily limit for blood glucose readings. Please try again tomorrow.")
      end
    end
end
