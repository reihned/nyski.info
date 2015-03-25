class Trip <ActiveRecord::Base

	belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

	belongs_to :ski_location, class_name: 'SkiLocation'
	has_many :invitations
	has_many :users, through: :invitations

	enum status: [ :pending, :in_progress, :completed, :cancelled ]

	def halibut
		self.creator.name
	end
end
