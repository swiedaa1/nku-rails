class Attendance < ActiveRecord::Base
  belongs_to :users
  # Make sure :seat is present, is an integer and is only 1-4:
  validates :seat, :inclusion => 1..4
  validates :seat, :numericality => {:only_integer => true}
  validates :seat, presence: true
end
