class TagsController < ApplicationController
	def new
		@tag = Tag.new
	end

	def create
		tag = Tag.new(tag_params)
		tag.save
		redirect_to new_post_path
	end

	private

	def tag_params
		params.require(:tag).permit(:tag)
	end
end
