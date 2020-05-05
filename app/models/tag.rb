class Tag < ApplicationRecord
	#belongs_to :gossip
	has_many :gossips
	#has_many :gossips, through: :gossip_tags
end
