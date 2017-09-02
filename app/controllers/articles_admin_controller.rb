class ArticlesAdminController < ApplicationController
	def index
		@articles_admin = Article.all
	end
end
