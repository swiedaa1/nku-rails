class User < ActiveRecord::Base
validates :password,
	length: {minimum: 8}
def reset_password(params)
	if params[:password] == params[:password_confirmation]
	password_reset_at = Time.now
	save
	end
end 
end

