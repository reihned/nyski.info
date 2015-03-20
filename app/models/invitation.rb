class Invitation < ActiveRecord::Base
	belongs_to :user
	belongs_to :trip

	validates :trip, uniqueness: { scope: :user }

	scope :rsvped, -> { where(rsvped: true) }
end