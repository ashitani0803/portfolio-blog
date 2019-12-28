class AboutsController < ApplicationController
    before_action :set_sidebar

	def profile
	end

	def privacy
	end

	def sitemap
	end

    private

    def set_sidebar
        @user = User.find(1)
        @tags = Tag.all
    end

end
