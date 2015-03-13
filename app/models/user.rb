class User < ActiveRecord::Base
	has_secure_password
	has_many :created_trips, class: Trip, foreign_key: :author_id

	

	validates :email, :password_digest, presence: :true
	validates :email, uniqueness: :true
	validates :email, email_format: { message: "incorrect email format" }

end
