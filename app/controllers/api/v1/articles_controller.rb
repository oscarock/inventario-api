module Api
  module V1
		class ArticlesController < ApiController
		  before_action :require_login
		  
		  # This is protected by API token
		  def index
		    render json: { articles: 'index articulos'}
		  end

		  def create
		  	
		  end
		end
	end
end