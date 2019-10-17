class PostsController < ApplicationController
  def index
		@posts = Post.all
  end

  def show
		@post = Post.find(params[:id])
  end

  def new
		@post = Post.new
  end

	def create
		post = Post.new(post_arams)
		if post.save
			flash[:success] = "記事を作成しました"
			redirect_to post_path(post.id) 
		else
			flash[:alert] = "記事の作成に失敗しました"
			render :new
		end
	end

	def edit

	end

	def update

	end

	def destroy

	end

	private

	def post_params
		params.require(:post).permit(:title, :tag, :image, :content, :status)
	end
end
