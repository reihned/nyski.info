class Trip <ActiveRecord::Base
	belongs_to :user
	belongs_to :author , class: User


end