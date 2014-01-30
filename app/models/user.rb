class User < ActiveRecord::Base
validates :password,
	length: {minimum: 8}
	def recent_completed(num)
	 where(completed: true).limit(num)
	end
	def Full_name
	 "#{first_name} #{last_name}"
	end
	def reset_password(params)
		if params[:password] == params[:password_confirmation]
		  password_reset_at = Time.now
		  save
		end
	end
end
