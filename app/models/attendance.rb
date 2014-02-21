class Attendance < ActiveRecord::Base
  belongs_to :users
  
#  validates :user_id, uniqueness: {scope: :attended_on, 
#    message: "Each student may only attend once per day." }
  validates :seat, :inclusion => 1..4
  validates :seat, :numericality => {:only_integer => true}
  validates :seat, presence: true
end
