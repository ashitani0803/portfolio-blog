class PostsController < ApplicationController
    before_action :set_admin

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

    private

    def set_admin
        @user = User.find(1)
    end

end
