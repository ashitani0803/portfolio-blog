class AboutsController < ApplicationController
	def profile
		@user = User.find(1)
	end

	def privacy
	end

	def sitemap
	end
end
