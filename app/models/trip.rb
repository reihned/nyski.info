class Trip <ActiveRecord::Base
	belongs_to :user
	belongs_to :author , class: User

	enum status: [ :pending, :in_progress, :completed, :cancelled ]



end