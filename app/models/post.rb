class Post < ApplicationRecord
	belongs_to :tag

	enum status: {下書き: 0, 公開中: 1}

	attachment :image
end
