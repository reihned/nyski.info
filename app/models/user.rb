class User < ActiveRecord::Base
	has_secure_password
	has_many :created_trips, class_name: 'Trip'
	has_many :invitations
	has_many :trips, through: :invitations	

	validates :email, :password_digest, presence: :true
	validates :email, uniqueness: :true
	validates :email, email_format: { message: "incorrect email format" }
end
