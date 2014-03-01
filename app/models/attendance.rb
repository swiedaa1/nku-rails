class Attendance < ActiveRecord::Base
  belongs_to :user
  # Make sure :seat is present, is an integer and is only 1-4:
  validates :seat, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 4
  }
  validates :seat, presence: true
end
