class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Reports all belong to the user that created them
  has_many :reports

  # Readings all belong to the user that created them
  has_many :readings do

    # Returns readings created today by user
    def today
      where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now))
    end
  end
end
