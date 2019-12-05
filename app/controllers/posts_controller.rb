class PostsController < ApplicationController
  def index
		if params[:tag_id]
			@tag = Tag.find(params[:tag_id])
			@posts = @tag.posts
		else
			@posts = Post.all
		end
  end

  def show
		@post = Post.find(params[:id])
  end

  def search
    @posts = Post.search(params[:search])
  end

end
