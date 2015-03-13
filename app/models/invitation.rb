class Invitation < ActiveRecord::Base
	belongs_to :user
	belongs_to :trip

	scope :rsvped, -> { where(rsvped: true) }
end