#module Admin
	class UsersController < ApplicationController
		def index
			@users = User.all
		end

		def new
			@user = User.new
		end

		def create
			@user = User.new(user_params)
			@user.profile_id = 2
			if @user.save
				redirect_to users_path(), notice: "Usuario Registrado Correctamente."
			else
				@errors = @user.errors.full_messages
				render :new
			end
		end

		def edit
			@user = User.find(params[:id])
		end

		def update
			@user = User.find(params[:id])
			if @user.update(user_params)
				redirect_to users_path(), notice: "Usuario Editado Correctamente."
			else
				@errors = @user.errors.full_messages
				render :edit	
			end
		end

		def destroy
			user = User.find(params[:id])
			user.destroy

			redirect_to users_path(), notice: "Usuario Eliminado Correctamente."
		end

		private
			def user_params
				params.require(:user).permit(:name, :email, :password)
			end
	end
#end