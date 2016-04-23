class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :readings do
    def today
      where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now))
    end
  end
end
