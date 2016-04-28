class Reading < ActiveRecord::Base
  # Each reading belongs to the user that created it
  belongs_to :user

  # Quota limits the number of readings one can submit per day
  validate :reading_quota, :on => :create

  # record glucose level, ensure it is a positive integer
  validates :glucose_level, presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0,
                            :message => "Readings must be a positive integer. Please try again."}
  # Ensure current_user is accessible
  mattr_accessor :current_user

  # default scope for readings arranges them in ascending order
  default_scope { order(created_at: :asc) }

  scope :within_dates, ->(d1, d2) {where(:created_on => d1..d2)}

  private
    # Checks that users have not created 4 readings 'today' yet.
    # The limit for daily new readings is no more than 4. See 'Sweety.Requirements.txt'
    def reading_quota
      if current_user && current_user.readings.today.count >= 4
        errors.add(:base, "Exceeds daily limit for blood glucose readings. Please try again tomorrow.")
      end
    end
end
