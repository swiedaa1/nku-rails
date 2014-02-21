class User < ActiveRecord::Base
 validates :name, presence: true,                                                                                                                                                                            
                    length: { minimum: 2 } 
 validates :nickname, presence: true,                                                                                                                                                                            
                    length: { minimum: 2 } 
 has_secure_password
 has_many :attendances, dependent: :destroy
  
  def self.in_seat(seat, date)
    attendances =  Attendance.where("attended_on = ? AND seat = ?", date, seat)
    user_ids = attendances.collect{ |a| a.user_id }
    return User.find(user_ids)
  end
  def self.absent(date)
    attendances = Attendance.where("attended_on = ?", date)
    present_users = attendances.collect{ |a| a.user_id }
    return User.where.not(id: present_users)
  end
    
end
