class Membership < ApplicationRecord
	extend FriendlyId
    friendly_id :firstname, use: :slugged
	
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :member_id, presence: true
	

	has_one_attached :image

	has_many :tithes, dependent: :destroy

end
