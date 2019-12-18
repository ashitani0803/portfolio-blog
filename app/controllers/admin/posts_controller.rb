class Admin::PostsController < ApplicationController
    before_action :admin_user?
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
        if params[:tag_id]
            @tag = Tag.find(params[:tag_id])
            @posts = @tag.posts
        else
            @posts = Post.all
        end
    end

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        tag_lists = params[:post][:tag_name].split(",")
        if @post.save
            @post.save_posts(tag_lists)
            flash[:success] = "記事を作成しました"
            redirect_to admin_post_path(@post)
        else
            flash[:alert] = "記事の作成に失敗しました"
            render :new
        end
    end

    def edit
        @tag_lists = @post.tags.pluck(:tag_name).join(",")
    end

    def update
        tag_lists = params[:post][:tag_name].split(",")
        if @post.update(post_params)
            @post.save_posts(tag_lists)
            flash[:success] = "記事を更新しました"
            redirect_to admin_post_path(@post)
        else
            flach[:alert] = "記事の更新に失敗しました"
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to admin_posts_path
    end

    private

    def post_params
        params.require(:post).permit(:title, :status, :body, :tag_id)
    end

    def admin_user?
        redirect_to root_path unless user_signed_in?
    end

    def set_post
        @post = Post.find(params[:id])
    end
end
