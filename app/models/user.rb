class User < ActiveRecord::Base
	has_secure_password
	

	validates :email, :password_digest, presence: :true
	validates :email, uniqueness: :true
	validates :email, email_format: { message: "incorrect email format" }

end
