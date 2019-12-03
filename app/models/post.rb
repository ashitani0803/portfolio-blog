class Post < ApplicationRecord
	has_many :tag_maps, dependent: :destroy
	has_many :tags, through: :tag_maps 	

	has_rich_text :body

	enum status: { draft: 0, published: 1 }

    def self.search(search)
        return Post.all unless search
        Post.where(['title LIKE ?', "%#{search}%"])
    end

	def save_posts(tags)
		current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?

      	old_tags = current_tags - tags
		new_tags = tags - current_tags

		#destroy
		old_tags.each do |old_name|
			self.tags.delete Tag.find_by(tag_name: old_name)
		end

		#create
		new_tags.each do |new_name|
			post_tag = Tag.find_or_create_by(tag_name: new_name)
			self.tags << post_tag
		end
	end
end
