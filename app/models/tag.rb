class Tag < ApplicationRecord
	has_many :posts, through: :tag_maps
	has_many :tag_maps, dependent: :destroy

	validates :tag_name, uniqueness: true

	accepts_nested_attributes_for :posts
end
