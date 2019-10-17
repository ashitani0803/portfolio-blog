class Post < ApplicationRecord
	belongs_to :tag

	attachment :image
end
