class AboutsController < ApplicationController
    before_action :set_admin

	def profile
	end

	def privacy
	end

	def sitemap
	end

    private

    def set_admin
        @user = User.find(1)
    end
end
