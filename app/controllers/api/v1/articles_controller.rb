module Api
  module V1
		class ArticlesController < ApiController
		  before_action :require_login
		  
		  def index
		  	articles = Article.where(user_id: current_user.id)
		    render json: { 
		    	articles: articles,
		    	status: 200
				}
		  end

		  def create
		  	articles = Article.new(article_params)

			  if articles.save
			    render json: {
            status: 201,
            articles: articles
          }
			  else
			    render json: {
            status: 422,
            errors: articles.errors.full_messages
          }
			  end
		  end

		  def update
		  	article = Article.find(params[:id])
        if article.update(article_params)
          render json:{
            status: 200
          }
      	else
          render json:{
            status: 422,
            errors: product.errors.full_messages
          }
        end
		  end

		  

		  private
        def article_params
          params.require(:article).permit(:code, :description).merge(user_id: current_user.id)
        end
		end
	end
end


