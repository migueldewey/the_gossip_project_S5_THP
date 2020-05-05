class Gossip < ApplicationRecord
	belongs_to :user
	has_many :tags
	#has_many :tags, through: :gossip_tags
end
