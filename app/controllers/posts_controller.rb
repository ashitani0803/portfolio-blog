class PostsController < ApplicationController
  def index
		if params[:tag_id]
			@tag = Tag.find(params[tag_id])
			@posts = @tag.posts
		else
			@posts = Post.all	
		end
  end

  def show
		@post = Post.find(params[:id])
  end

  def new
		@post = Post.new
  end

	def create
		post = Post.new(post_params)
		tag_lists = params[:post][:tag_name].split(",")
		if post.save
			post.save_posts(tag_lists)
			flash[:success] = "記事を作成しました"
			redirect_to post_path(post.id)
		else
			flash[:alert] = "記事の作成に失敗しました"
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
		@tag_lists = @post.tags.pluck(:tag_name).join(",")
	end

	def update
		post = Post.find(params[:id])
		tag_lists = params[:post][:tag_name].split(",")
		if post.update(post_params)
			post.save_posts(tag_lists)
			flash[:success] = "li寺を更新しました"
			redirect_to post_path(post.id)
		else
			flach[:alert] = "記事の更新に失敗しました"
			render :edit
		end	
	end

	def destroy

	end

	private

	def post_params
		params.require(:post).permit(:title, :status, :body, :tag_id)
	end
end
