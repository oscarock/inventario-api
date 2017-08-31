module Api
  module V1
		class MovementsController < ApiController
			skip_before_action  :verify_authenticity_token
		  before_action :require_login

		  def create
		  	movements = Movement.new(movement_params)

			  if movements.save
			    render json: {
            status: 201,
            movements: movements
          }
			  else
			    render json: {
            status: 422,
            errors: movements.errors.full_messages
          }
        end 
		  end

		  private
        def movement_params
          params.require(:movement).permit(:movement_type_id, :article_id, :amount)
        end
		end
	end
end


 # HTTParty.post('http://localhost:3000/api/v1/movements', body: { movement_type: 1, amount: 30, article_id: 1}.to_json, headers: {"Authorization" => "Token token=\"nmw92JSxui4ouHXugZHigZ2a\"", 'Content-Type' => 'application/json' })
 # HTTParty.post('http://localhost:3000/api/v1/movements', body: { movement_type: 1213}.to_json, headers: {"Authorization" => "Token token=\"nmw92JSxui4ouHXugZHigZ2a\"", 'Content-Type' => 'application/json' })
 # HTTParty.post('http://localhost:3000/api/v1/articles', body: { code: 1213, description: "camisas"}.to_json, headers: {"Authorization" => "Token token=\"nBKoZhg2QZXpmra8dxeepDM2\"", 'Content-Type' => 'application/json' })