module Api
  module V1
		class ArticlesController < ApiController
		  before_action :require_login
		  
		  def index
		  	@articles = Article.where(user_id: current_user.id)
		    render json: {
		    	articles: @articles,
		    	status: 200
				}
		  end

		  def create
		  	articles = Article.new(article_params)

			  if articles.save
			    render json: {
			    	message: "Articulo Guardado Correctamente.", 
            status: 201,
            articles: articles
          }
			  else
			    render json: {
			    	message: "Errores de Validacion.", 
            status: 422,
            errors: articles.errors.full_messages
          }
			  end
		  end

      def show
        article = Article.find(params[:id])
        render json:{
          article: article,
          status: 200
        }
      end

		  def update
		  	article = Article.find(params[:id])
        if article.update(article_params)
          render json:{
          	message: "Articulo Editado Correctamente.", 
            status: 200
          }
      	else
          render json:{
          	message: "Errores de Validacion.", 
            status: 422,
            errors: product.errors.full_messages
          }
        end
		  end

		  def destroy
		  	if current_user.profile_id == 1
		  		article = Article.find(params[:id])
		  		article.destroy
        	render json:{
        		message: "Articulo Eliminado Correctamente.", 
            status: 204
        	}
        else
        	render json:{
        		message: "No tienes Permiso para esta Accion.", 
            status: 403
        	}	
		  	end
      end

      def total_articles
		  	if Article.exists?(id: params[:id])
		  		article_total = Article.find(params[:id])
		  		if article_total.user_id == current_user.id 
		  			total = Movement.total(params[:id])
  		  		render json:{
  		  			message: "Numero de unidades del Articulo",
  		  			total_articles: total,	
  		  			status: 200
  					}
  				else
  					render json:{
  						message: "Este Articulo no te pertenece",
  		  			status: 403
  					}	
		  		end
  		  else
  				render json:{
  					message: "el id del Articulo no existe",
  		  		status: 404
  				}	
		  	end
		  end

		  private
        def article_params
          params.require(:article).permit(:image_url, :code, :description).merge(user_id: current_user.id)
        end
		end
	end
end


