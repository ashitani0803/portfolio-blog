class PostsController < ApplicationController
    before_action :set_sidebar

    def index
		if params[:tag_id]
			@tag = Tag.find(params[:tag_id])
			@posts = @tag.posts.all.order(id: "DESC").page(params[:page]).per(10)
		else
			@posts = Post.all.order(id: "DESC").page(params[:page]).per(10)
		end
    end

    def show
	  	@post = Post.find(params[:id])
    end

    def search
        @posts = Post.search(params[:search]).order(id: "DESC").page(params[:page]).per(10)
    end

    private

    def set_sidebar
        @user = User.find(1)
        @tags = Tag.all
    end

end
