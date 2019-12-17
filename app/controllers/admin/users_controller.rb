class Admin::UsersController < ApplicationController
  before_action :admin_user?

  def edit
    @user = current_user
  end
  
  def update
    user = current_user
    if user.update(admin_params)
        redirect_to admin_posts_path
    else
        render :edit
    end
  end

  private

  def admin_params
    params.require(:user).permit(:name, :image, :profile)
  end

  def admin_user? 
    redirect_to root_path unless user_signed_in?
  end
end
