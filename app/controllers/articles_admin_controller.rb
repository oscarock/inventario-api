class ArticlesAdminController < ApplicationController
	def index
		@articles_admin = Articles.all
	end
end
