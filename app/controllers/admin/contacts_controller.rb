class Admin::ContactsController < ApplicationController
    before_action :admin_user?

    def index
        @contacts = Contact.all.order(id: "DESC").page(params[:page]).per(10)
    end

    def show
        @contact = Contact.find(params[:id])
    end

    private

    def admin_user?
        redirect_to root_path unless user_signed_in?
    end
end
