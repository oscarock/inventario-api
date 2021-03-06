module Api
  module V1
		class MovementsController < ApiController
			skip_before_action  :verify_authenticity_token
		  before_action :require_login

		  def index
  	  	movements = Movement.where(user_id: current_user.id)
		    render json: { 
		    	movements: movements,
		    	status: 200
				}
		  end

			def create
		  	movements = Movement.new(movement_params)

			  if movements.save
			    render json: {
            message: "Movimiento Guardado Correctamente.", 
            status: 201,
            movements: movements
          }
			  else
			    render json: {
            message: "Errores de Validacion.", 
            status: 422,
            errors: movements.errors.full_messages
          }
        end 
		  end

      def show
        movement = Movement.find(params[:id])
        render json:{
          movement: movement,
          status: 200
        }
      end

		  def update
		  	movement = Movement.find(params[:id])
        if movement.update(movement_params)
          render json:{
            message: "Movimiento Editado Correctamente.", 
            status: 200
          }
      	else
          render json:{
            message: "Errores de Validacion.",
            status: 422,
            errors: movement.errors.full_messages
          }
        end		  	
		  end

		  def destroy
		  	if current_user.profile_id == 1
		  		movement = Movement.find(params[:id])
        	movement.destroy
        	render json:{
            message: "Movimiento Eliminado Correctamente.", 
          	status: 204
        	}
        else
        	render json:{
            message: "No tienes Permiso para esta Accion.", 
            status: 403
        	}	
		  	end
		  end

		  private
        def movement_params
          params.require(:movement).permit(:movement_type_id, :article_id, :amount).merge(user_id: current_user.id)
        end
		end
	end
end


 # HTTParty.post('http://localhost:3000/api/v1/movements', body: { movement_type: 1, article_id: 1, amount: 30}.to_json, headers: {"Authorization" => "Token token=\"yNFCzqudFMXAkD7AuBbX5rHj\"", 'Content-Type' => 'application/json' })
 # HTTParty.post('http://localhost:3000/api/v1/movements', body: { movement_type: 1213}.to_json, headers: {"Authorization" => "Token token=\"nmw92JSxui4ouHXugZHigZ2a\"", 'Content-Type' => 'application/json' })
 # HTTParty.post('http://localhost:3000/api/v1/articles', body: { code: 1213, description: "camisas"}.to_json, headers: {"Authorization" => "Token token=\"nBKoZhg2QZXpmra8dxeepDM2\"", 'Content-Type' => 'application/json' })
 # HTTParty.post('http://localhost:3000/api/v1/articles', body: { code: 1213, description: "camisas"}.to_json, headers: {"Authorization" => "Token token=\"MScmHbfmHECwVY9VBSg5nRoi\"", 'Content-Type' => 'application/json' })
 #HTTParty.get("http://localhost:3000/api/v1/total_articles/1", headers: {"Authorization" => "Token token=\"yNFCzqudFMXAkD7AuBbX5rHj\