class Report < ActiveRecord::Base
  belongs_to :user
  mattr_accessor :current_user
end
